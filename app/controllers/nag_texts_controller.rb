class NagTextsController < ApplicationController
  before_filter :load_site
  before_filter :load_text, only: :show

  def update
    text = params[:nag_text]
    head(400) and return unless text
    cfg = @site.site_config || @site.create_site_config
    cfg.nag = text
    cfg.save!
    render json: {text: text}
  end

  def show
    render json: {text: @nag_text}
  end
end
