class ArticlesController < ApplicationController

  include Paginable

  def index
    articles = Article.recent
    paginated = paginator.call(
      articles,
      params: pagination_params,
      base_url: request.url
    )
    options = { meta: paginated.meta.to_h, links: paginated.links.to_h}
    render json: serializer.new(paginated.items, options), status: :ok
  end
  def show
    render json: {}
  end
  def serializer 
    ArticleSerializer
  end



end
