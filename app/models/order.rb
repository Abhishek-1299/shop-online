class Order < ApplicationRecord
	enum :status, [:cart, :address, :payment, :complete]	
end
