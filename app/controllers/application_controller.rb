class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :md

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
end
