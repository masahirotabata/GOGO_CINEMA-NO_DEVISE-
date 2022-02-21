class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to:movie
  belongs_to :movie_comment
end
