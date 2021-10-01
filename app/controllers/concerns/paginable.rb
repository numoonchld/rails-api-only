module Paginable 
  extend ActiveSupport::Concern

  def paginator
    JSOM::Pagination::Paginator.new
  end

  def pagination_params
    params.permit![:page]
  end

end