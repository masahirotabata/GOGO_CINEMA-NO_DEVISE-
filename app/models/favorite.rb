class Favorite < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to:movie, optional: true
  belongs_to :movie_comment, optional: true
end
