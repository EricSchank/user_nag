class NagTextsController < ApplicationController
  before_filter :load_site

  def update
    Rails.logger.error "\nPAR: #{params.inspect}\n"
    text = params[:nag_text]
    head(400) and return unless text
    cfg = @site.site_config.find_or_create
    cfg.nag = text
    cfg.save!
    head(200)
  end

  def created
  end

end
