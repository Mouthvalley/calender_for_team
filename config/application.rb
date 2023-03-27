require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module CalenderForTeam
  class Application < Rails::Application
    config.load_defaults 6.1

    config.time_zone = "Tokyo" # タイムゾーンを設定
    config.i18n.available_locales = [:ja, :en] # 利用可能なロケールを設定
    config.i18n.default_locale = :ja # デフォルトのロケールを設定
  end
end
