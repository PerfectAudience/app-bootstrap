NowspotsImages::Application.configure do
  config.cache_classes = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = false
  config.assets.compress = true
  config.assets.compile = false
  config.assets.digest = true
  config.assets.precompile += %w( nowspots-yourapp.js nowspots-yourapp.css errors.css )
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
end
