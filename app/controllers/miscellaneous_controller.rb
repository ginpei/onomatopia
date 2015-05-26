class MiscellaneousController < ApplicationController
  helper_method :translation_type?

  def with_global_header
    false
  end

  def home
    @with_global_header = false

    @categories = Category.all

    @top_onomatopoeias = []
    @top_onomatopoeias.push(get_top_onomatopoeias_list_item(1, 'KABOOM'))
    @top_onomatopoeias.push(get_top_onomatopoeias_list_item(2, 'THUMP'))
    @top_onomatopoeias.push(get_top_onomatopoeias_list_item(2, 'CHEER'))
    @top_onomatopoeias.push(get_top_onomatopoeias_list_item(3, 'SOB'))
    @top_onomatopoeias.push(get_top_onomatopoeias_list_item(3, 'CRASH'))
    @top_onomatopoeias.push(get_top_onomatopoeias_list_item(3, 'WOOF'))
  end

  def search
    @keyword = params[:keyword]
    if @keyword.nil? or @keyword.empty?
      @page_title = 'Search'
    else
      @page_title = "Search for #{@keyword}"
    end
    @synonyms = Onomatopoeia.search(@keyword)
  end

  def change_locale
    locale = params[:locale]
    unless locale.to_sym.presence_in I18n.available_locales
      fail 'Unavailable locale'
    end

    session[:locale] = locale
    session[:translation_type] = nil

    redirect_to request.referrer
  end

  def change_translation_type
    language = params[:language]
    if language.presence_in ['jaen', 'enja']
      session[:translation_type] = language
    end
    redirect_to request.referrer
  end

  def translation_type?(type)
    current_type = session[:translation_type]
    unless current_type
      if current_locale == 'en'
        current_type = session[:translation_type] = 'enja'
      elsif current_locale == 'ja'
        current_type = session[:translation_type] = 'jaen'
      end
    end
    type == current_type
  end

  private
    def get_top_onomatopoeias_list_item(span, name)
      onomatopoeia = Onomatopoeia.find_by_name(name)
      onomatopoeia.locale = current_locale
      illustration = onomatopoeia.illustrations.first
      { span: span, onomatopoeia: onomatopoeia, illustration: illustration }
    end
end
