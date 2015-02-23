require 'rails_helper'

RSpec.describe 'Api::V1::Search', type: :request do
  describe 'GET /api/v1/search?name=<query>' do
    context 'query がないとき' do
      before do
        get '/api/v1/search'
      end

      it '400 エラーを返す' do
        expect(response).to have_http_status(400)
      end
    end

    context 'query があるとき' do
      before do
        get '/api/v1/search?name=momoclo'
      end

      it '200 を返す' do
        expect(response).to have_http_status(200)
      end

      it '画像配列を返す' do
      end
    end
  end
end
