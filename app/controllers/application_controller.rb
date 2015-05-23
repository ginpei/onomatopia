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
      I18n.locale = current_locale
    end

    def current_locale
      unless @current_locale
        locale = session[:locale] || request.env['HTTP_ACCEPT_LANGUAGE'][0..1] || I18n.default_locale
        if locale.to_sym.presence_in I18n.available_locales
          @current_locale = locale
        else
          @current_locale = I18n.default_locale
        end

        session[:locale] = locale
      end
      @current_locale
    end
end
