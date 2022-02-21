class Admin < ApplicationRecord
  has_many :movies
  has_many :customers
  has_many :admins
  has_many :movies_cooments
end
