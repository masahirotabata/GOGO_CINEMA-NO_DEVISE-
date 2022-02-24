class Customer < ApplicationRecord
  has_many :movies
  has_many :movie_comments
  has_many :favorites

  has_secure_password

  has_many :active_relationships,
  class_name: 'Relationship',
  foreign_key: 'follower_id'

  has_many :following,
  through: :active_relationships,
  source: :followed

  has_many :passive_relationships,
  class_name: 'Relationship',
  foreign_key: 'followed_id'

  has_many :followers,
  through: :passive_relationships,
  source:  :follower

  has_many :active_notifications,
  class_name: "Notification",
  foreign_key: "visiter_id",
  dependent: :destroy

  has_many :passive_notifications,
  class_name: "Notification",
  foreign_key: "visited_id",
  dependent: :destroy

  attachment :image

    #ユーザーをフォローする
  def follow(other_customer)

    self.active_relationships.create(followed_id: other_customer.id)
  end

  #ユーザーをフォロー解除する
  def  unfollow(other_customer)
    self.active_relationships.find_by(followed_id: other_customer.id).destroy

  end

  #現在のユーザーがフォローしてたらtrueを返す
  def following?(other_customer)
    self.following.include?(other_customer)
  end

  def matching
    @matchers = following & followers
  end

 def favorited_by?(customer)
    favorites.find(customer_id: customer.id).exists?
end

 def current_customer
 @current_customer ||= Customer.find_by(id: session[:customer_id]) if session[:customer_id]
 end

end
