class HomeController < ApplicationController
  before_filter :load_site

  def index
  end

  def nag
    head status: 200
  end

  private

  def load_site

  end
end
