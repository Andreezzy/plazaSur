class AtpImpost < ApplicationRecord
	self.table_name = "atp_impost"
  belongs_to :product
end
