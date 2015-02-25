class GetImagesWorker
  include Sidekiq::Worker

  sidekiq_options unique: true

  def perform(id)
    bijo = Bijo.find(id)
    tumblr_client = TumblrClient.new
    urls = tumblr_client.get_with_tagg(bijo.name)
    urls.each do |url|
      bijo.images.create(url: url)
    end
  end
end
