class Api::V1::SearchController < ApplicationController
  before_action :has_valid_query?

  def index
    if has_valid_query?
      response = tumblr_client.get_with_tagg(name_query)
      redis_client.add_name(name_query)
      render json: response
    else
      head :bad_request
    end
  end

  private

  def name_query
    params[:name]
  end

  def has_valid_query?
    !!name_query && name_query.present?
  end

  def tumblr_client
    @tumblr_client ||= TumblrClient.new
  end

  def redis_client
    @redis_client ||= RedisClient.new
  end
end
