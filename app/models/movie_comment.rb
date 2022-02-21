class MovieComment < ApplicationRecord
  belongs_to :movie
  belongs_to :customer , optional: true
  has_many :favorites
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true

    def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
    end

end
