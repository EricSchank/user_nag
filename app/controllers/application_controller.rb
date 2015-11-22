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

  # DEFAULT_TEXT = 'Just a quick reminder that we need a little more info from you on this issue.&#13;&#10;When you get a chance, please give us an update so we can continue to help with this issue.&#13;&#10;Thanks!'
  DEFAULT_TEXT = 'Just a quick reminder that we need a little more info from you on this issue.\nWhen you get a chance, please give us an update so we can continue to help with this issue.\nThanks!'
  def load_text
    @nag_text = @site.site_config.nag rescue DEFAULT_TEXT
  end

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end

end
