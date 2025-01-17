class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :movie 
  
  validates :customer_id, presence: true
  validates :movie_id, presence: true
  validates :check_out_date, presence: true 
  validates :due_date, presence: true  
end
