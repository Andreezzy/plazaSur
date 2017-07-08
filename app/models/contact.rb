class Contact < ApplicationRecord
	self.table_name = "contact"
  belongs_to :provider
  belongs_to :person
end
