class Charge < ApplicationRecord
    self.table_name = "charge"
    has_many :users
end
