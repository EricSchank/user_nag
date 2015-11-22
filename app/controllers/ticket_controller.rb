class TicketController < ApplicationController
  before_filter :load_site
  append_before_filter :load_text

  def index
  end
end
