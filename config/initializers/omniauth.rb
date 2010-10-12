Rails.application.config.middleware.use OmniAuth::Builder do
  require "openid/store/filesystem"
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :GoogleApps, OpenID::Store::ActiveRecord.new, :domain => ENV['GOOGLE_DOMAIN']
end