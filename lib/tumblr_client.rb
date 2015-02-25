class TumblrClient
  def initialize
    @client = Tumblr::Client.new

    Tumblr.configure do |config|
      config.consumer_key = Figaro.env.consumer_key!
      config.consumer_secret = Figaro.env.consumer_secret!
      config.oauth_token = Figaro.env.oauth_token!
      config.oauth_token_secret = Figaro.env.oauth_token_secret!
    end
  end

  def get_with_tagg(query)
    results = @client.tagged(query)

    urls = parse_search_results(results)
  end

  def parse_search_results(results)
    urls = []

    results.each do |res|
      next unless res['type'] == 'photo'

      photos = res['photos']
      photos.each do |photo|
        urls <<  photo['original_size']['url']
      end
    end

    urls
  end
end
