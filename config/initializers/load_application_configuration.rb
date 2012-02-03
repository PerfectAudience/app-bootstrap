config_path = File.join(Rails.root, 'config', 'application.yml')
config = File.new(config_path).read
erb_result = ERB.new(config).result
APP_CONFIG = YAML.load(erb_result)[Rails.env]
