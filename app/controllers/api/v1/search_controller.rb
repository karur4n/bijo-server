class Api::V1::SearchController < ApplicationController
  include Client
  include TumblrClient

  before_action :has_valid_query?

  def index
    if has_valid_query?
      response = self.get_with_tagg(name_query)
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
end
