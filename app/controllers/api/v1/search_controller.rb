class Api::V1::SearchController < ApplicationController
  def index
    if valid_query?
      bijo = Bijo.find_or_create_by(name: name_query) do |b|
        now_datetime = DateTime.now
        b.referenced_at = now_datetime
        b.crawled_at = now_datetime
      end

      if bijo.images.present?
        render json: bijo.return_urls
      else
        response = TumblrResponse.new(tumblr_client.tagged(bijo.name))
        GetImagesWorker.perform_async(bijo.id)
        render json: response.urls
      end
    else
      head :bad_request
    end
  end

  private

  def name_query
    params[:name]
  end

  def valid_query?
    !!name_query && name_query.present?
  end

  def tumblr_client
    tumblr_client ||= TumblrClient.new
  end
end
