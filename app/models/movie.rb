class Movie < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :admin, optional:true
  has_many :movie_comments, dependent: :destroy
  attachment :image

   def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
end

end
