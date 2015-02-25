Tumblr.configure do |config|
  config.consumer_key = Figaro.env.consumer_key!
  config.consumer_secret = Figaro.env.consumer_secret!
  config.oauth_token = Figaro.env.oauth_token!
  config.oauth_token_secret = Figaro.env.oauth_token_secret!
end
