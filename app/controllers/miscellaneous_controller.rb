class MiscellaneousController < ApplicationController
  def with_global_header
    false
  end

  def home
    @top_onomatopes = []
    @top_onomatopes.push(get_top_onomatopes_list_item(1, 'KABOOM'))
    @top_onomatopes.push(get_top_onomatopes_list_item(2, 'THUMP'))
    @top_onomatopes.push(get_top_onomatopes_list_item(2, 'CHEER'))
    @top_onomatopes.push(get_top_onomatopes_list_item(3, 'SOB'))
    @top_onomatopes.push(get_top_onomatopes_list_item(3, 'CRASH'))
    @top_onomatopes.push(get_top_onomatopes_list_item(3, 'WOOF'))

    @onomatopes = Onomatope.all
  end

  def search
    @keyword = params[:keyword]
    @synonyms = Onomatope.search(@keyword)
  end

  def change_locale
    locale = params[:locale]
    unless locale.to_sym.presence_in I18n.available_locales
      fail 'Unavailable locale'
    end

    session[:locale] = locale

    redirect_to request.referrer
  end

  private
    def get_top_onomatopes_list_item(span, name)
      onomatope = Onomatope.find_by_name(name)
      illustration = onomatope.illustrations.first
      { span: span, onomatope: onomatope, illustration: illustration }
    end
end
