class Api::V1::SearchController < ApplicationController
  before_action :valid_query?

  def index
    if valid_query?
      bijo = Bijo.find_or_create_by(name: name_query) do |b|
        b.referenced_at = DateTime.now
      end

      if bijo.images.present?
        render json: bijo.images.offset(rand(bijo.images.count)).first.url
      else
        response = tumblr_client.get_with_tagg(name_query)
        puts 'Call GetImagesWorker'
        GetImagesWorker.perform_async(bijo.id)
        puts 'Called'
        render json: response[rand(response.size)]
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
