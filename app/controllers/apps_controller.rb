class AppsController < ApplicationController

  def show
    @app           = App.new(params)
    @customization = Customization.new(params)

    app_valid = @app.valid?
    customization_valid = @customization.valid?

    if app_valid && customization_valid
      render template: 'apps/show', layout: 'serve'
    else
      render template: 'apps/error', layout: 'errors'
    end
  end
end

