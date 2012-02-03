NowspotsImages::Application.routes.draw do
  get '/' => redirect('/serve?source=nowspots')
  get '/serve' => 'apps#show'
  get '/customization' => 'customizations#show', :as => 'customization'
  get '/settings' => 'settings#show', :as => 'settings'
end
