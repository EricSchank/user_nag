class HomeController < ApplicationController
  # before_filter :load_site
  append_before_filter :load_text
  # after_filter :allow_iframe

  def index
  end
end
