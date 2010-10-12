Rails.application.config.middleware.use OmniAuth::Builder do
  require 'memcached'
  require "openid/store/memcache"
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :GoogleApps, OpenID::Store::Memcache.new(Memcached::Rails.new), :domain => ENV['GOOGLE_DOMAIN']
end