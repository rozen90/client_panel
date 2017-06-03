class WelcomeController < ApplicationController

  def index
    if current_model
      shops = current_model.shops
      @categories = category
      sort_by_category = params[:category] || @categories
      type = params[:type] || "price"
      if shops.empty?
        @products = []
      else
        @products = shops.select('products.*,shops.*').joins(:products)
                                               .where(products: {breadcrumb: sort_by_category})
                                               .merge(Product.order("#{type}": :desc))
                                               .page(params[:page]).per(10)
      end
      @category_name = category_name
    end
  end

  private

  def category()
  	cat = Product.select("distinct(products.breadcrumb)")
    cat.map {|val| val[:breadcrumb]}
  end

  def category_name()
    params[:category] ? params[:category] : "All"
  end

end
