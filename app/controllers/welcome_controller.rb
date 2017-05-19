class WelcomeController < ApplicationController

  def index
  	@a = current_model.shops rescue []
    @cat = category.map {|ds| ds[:breadcrumb]}
    breadcr = params[:category] || @cat.join(", ").gsub(', ',"','")
    type = params[:type] || "price"
    if @a.empty?
      @c = []
    else
      @c = @a.select('products.*,shops.*').joins(:products).where("products.breadcrumb in ('#{breadcr}')").order("#{type} desc").page(params[:page]).per(10)
    end
    @cat_name = category_name
    respond_to do |format|
      format.html {@c }
      format.json {render json: @c, status: 200}
    end
  end

  private

  def category()
  	cat = Product.select("distinct(products.breadcrumb)")
  end

  def category_name()
    params[:category] ? params[:category] : "All"
  end

end
