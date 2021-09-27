require 'rails_helper'

RSpec.describe ArticlesController do 
  describe '#index' do
    it 'returns a success response' do
      get '/articles'
      expect(response).to have_http_status(:ok)
      # expect(response.status).to eq(200)
    end

    it 'returns a propert JSON' do
      article = FactoryBot.create :article
      get '/articles'
      body = JSON.parse(response.body).deep_symbolize_keys
      expect(body).to eq(
        {
          data: [
            id: article.id.to_s,
            type: 'article',
            attributes: {
              title: article.title,
              content: article.content,
              slug: article.slug,
            }
          ]
        }
      )
    end

  end
end