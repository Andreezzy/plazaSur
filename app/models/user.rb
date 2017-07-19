class User < ApplicationRecord
    self.table_name = "user"
    belongs_to :charge
    belongs_to :person
    has_one :receipt
end
