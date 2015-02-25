class TumblrClient
  def initialize
    @client = Tumblr::Client.new
  end

  def get_with_tagg(query)
    results = @client.tagged(query)

    parse_search_results(results)
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
