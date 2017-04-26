class CreateModelsShops < ActiveRecord::Migration[5.0]
  def change
    create_table :models_shops, id: false do |t|
    	t.integer :shop_id
    	t.integer :model_id
    end
  end
end
