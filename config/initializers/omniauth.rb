Rails.application.config.middleware.use OmniAuth::Builder do
  require "openid/store/memcache"
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :GoogleApps, OpenID::Store::Memcache.new, :domain => ENV['GOOGLE_DOMAIN']
end