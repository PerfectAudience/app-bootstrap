class CustomizationsController < ApplicationController
  respond_to :css

  def show
    @customization = Customization.new(params)

    scss = render_to_string(:format => :scss)
    css = Sass::Engine.new(scss, :syntax => :scss).to_css
    render :inline => css, :layout => false
  end
end

