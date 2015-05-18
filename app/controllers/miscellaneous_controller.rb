class MiscellaneousController < ApplicationController
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
  end

  private
    def get_top_onomatopes_list_item(span, name)
      onomatope = Onomatope.find_by_name(name)
      illustration = onomatope.illustrations.first
      { span: span, onomatope: onomatope, illustration: illustration }
    end
end
