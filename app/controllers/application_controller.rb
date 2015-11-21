class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_filter :allow_iframe

  protected

  def load_site
    site = params[:site]
    head(404) and return unless site
    @site = Site.where(auid: site).first_or_create!
  end

  private

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

end
