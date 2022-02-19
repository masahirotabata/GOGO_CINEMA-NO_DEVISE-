class Movie < ApplicationRecord
  belongs_to :customer, optional:true
  belongs_to :movie_comment, optional:true
  attachment :image
end
