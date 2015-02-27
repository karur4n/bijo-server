class GetImagesWorker
  include Sidekiq::Worker

  sidekiq_options unique: true

  def perform(id = nil)
    @id = id
    if schedule_work?
      Bijo.all.each do |bijo|
        @response = TumblrResponse(tumblr_client.tagged(bijo.name))
        @response.sorted_desc_by_datetime.urls.each do |url|
          bijo.images.create(url: url)
        end
        bijo.update_crawled_at(@response.last_post_datetime)
      end
    else
      bijo = Bijo.find(id)
      @response = TumblrResponse.new(tumblr_client.tagged(bijo.name))
      @response.urls.each do |url|
        bijo.images.create(url: url)
        p "#{bijo.name} です"
      end

      bijo.update_crawled_at(@response.last_post_datetime)
      p 'Hi!'
    end
  end

  def schedule_work?
    !!@id.nil?
  end

  def tumblr_client
    tumblr_client ||= TumblrClient.new
  end
end
