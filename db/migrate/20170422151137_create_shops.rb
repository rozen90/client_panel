class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
    	t.string		 :shop_name
    	t.string		 :shop_patern	
      t.timestamps null: false
    end
  end
end
