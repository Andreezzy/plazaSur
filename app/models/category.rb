class Category < ApplicationRecord
	include AASM
  self.table_name = "category"
  has_many :products


  aasm do
    state :unplaced, :initial => true
    state :submitted
    state :processing
    state :shipped
    state :completed
    state :returned
    state :deleted

    event :submit do
      transitions :from => :unplaced, :to => :submitted
    end

    event :process do
      transitions :from => [:submitted, :returned], :to => :processing
    end

    event :ship do
      transitions :from => :processing, :to => :shipped
    end

    event :complete do
      transitions :from => :shipped, :to => :completed
    end

    event :return do
      transitions :from => :completed, :to => :returned
    end

    event :delete do
      transitions :from => :processing, :to => :deleted
    end
  end

end
