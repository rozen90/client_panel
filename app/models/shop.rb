class Shop < ApplicationRecord
	has_and_belongs_to_many :models
	has_many :products
end
