require 'rails_helper'

RSpec.describe ArticlesController do 
  describe '#index' do
    it 'returns a success response' do
      get '/articles'
      expect(response).to have_http_status(:ok)
      # expect(response.status).to eq(200)
    end

    it 'returns a proper JSON' do
      article = FactoryBot.create :article
      get '/articles'
      # body = JSON.parse(response.body).deep_symbolize_keys
      expect(json_data.length).to eq(1)
      expected = json_data.first
      expect(expected[:id]).to eq(article.id.to_s)
      expect(expected[:type]).to eq('article')
      expect(expected[:attributes]).to eq({
        title: article.title,
        content: article.content,
        slug: article.slug,
      })
    end

  end
end