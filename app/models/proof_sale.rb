class ProofSale < ApplicationRecord
	self.table_name = "proof_sale"
  belongs_to :sale
  belongs_to :product
  belongs_to :user
end
