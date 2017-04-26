require "csv"

class WelcomeController < ApplicationController

  def index
  	@a = current_model.shops rescue []
  	z = @a.map {|v| v.products.where(breadcrumb: "Суши")}.flatten
  	@c = Kaminari.paginate_array(z).page(params[:page]).per(10)
  	#s = CSV.read("/home/rozen/parsing_items/Crawlers/ProSushi/prosushi.by.csv",{headers: true})
    #@s = s.headers 
  end

  def delit()
  	@a = current_model.shops rescue []
  	@cat = category.map {|ds| ds[:breadcrumb]}
  	breadcr = params[:category] || @cat.join(", ").gsub(', ',"','")
  	type = params[:type] || "price"
  	@c = @a.select('products.*,shops.*').joins(:products).where("products.breadcrumb in ('#{breadcr}')").order("#{type} desc").page(params[:page]).per(10)
  end



  private

  def category()
  	cat = Product.select("distinct(products.breadcrumb)")
  end
end
