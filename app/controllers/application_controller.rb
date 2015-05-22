class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  helper_method :with_global_header
  helper_method :with_global_footer
  helper_method :md

  def with_global_header
    true
  end

  def with_global_footer
    true
  end

  def md(html)
    unless @md_renderer
      options = {
        autolink: true,
        tables: true
      }
      @md_renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    end
    @md_renderer.render(html).html_safe
  end

  private
    def set_locale
      I18n.available_locales = %i(en ja)
      I18n.locale = current_locale
    end

    def current_locale
      @current_locale ||= session[:locale] || I18n.default_locale
    end
end
