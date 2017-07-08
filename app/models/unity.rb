class Unity < ApplicationRecord
  self.table_name = "atp_unity"
  has_many :products
end
