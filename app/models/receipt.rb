class Receipt < ApplicationRecord
	self.table_name = "receipt"
  belongs_to :voucher
  belongs_to :provider
  belongs_to :user
  has_many :purchases
end
