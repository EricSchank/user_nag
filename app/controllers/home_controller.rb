class HomeController < ApplicationController
  before_filter :load_site
  after_filter :allow_iframe

  def index
  end

  def nag
    head status: 200
  end

  private

  def load_site

  end

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end
end
