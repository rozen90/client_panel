class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
    	t.string			:name
      t.integer     :shop_id
    	t.string			:url
    	t.string			:url_md5
    	t.float				:price
    	t.float 			:weigth
    	t.string			:image_url
    	t.string			:breadcrumb
    	t.string			:description
    	t.float				:regular_price
    	t.float				:price2
    	t.float				:regular_price2
    	t.string			:price_details
    	t.string			:price_details2
      t.datetime    :update_time  
      t.timestamps  null: false
    end
  end
end
