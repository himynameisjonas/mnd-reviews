Rails.application.config.middleware.use OmniAuth::Builder do
  require "openid/store/filesystem"
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :GoogleApps, OpenID::Store::Filesystem.new('/tmp'), ENV['GOOGLE_DOMAIN']
end