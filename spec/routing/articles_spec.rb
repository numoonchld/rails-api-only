require 'rails_helper'

RSpec.describe '/articles routes' do
  it 'routes to articles#index' do
    # expect(get '/articles').to route_to(controller: 'articles', action: 'index') # verbose route test
    aggregate_failures do
      expect(get '/articles').to route_to("articles#index")
      expect(get '/articles?page[number]=3').to route_to('articles#index', page: { 'number' => 3})
    end
  end

  it 'routes to articles#show' do
    expect(get '/articles/2').to route_to('articles#show', id: '2')
  end
end