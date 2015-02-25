if Rails.env == 'develop'
  Redis.current = Redis.new(host: '127.0.0.1', port: 6379)
elsif Rails.env == 'production'
  Redis.current = Redis.new(:url => ENV["REDISCLOUD_URL"])
end
