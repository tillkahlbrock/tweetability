require 'ostruct'
require 'yaml'

all_config = YAML.load_file("#{Rails.root}/config/passwords.yml") || {}
env_config = all_config[Rails.env] || {}
AppConfig = OpenStruct.new(env_config)