class TumblrClient
  def initialize
    @client ||= Tumblr::Client.new
  end

  def tagged(tag)
    response = @client.tagged(tag)
  end
end
