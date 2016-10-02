class Post < ActiveRecord::Base

  has_many :comments
  has_many :interest_posts
  has_many :interested_by, through: :interest_posts, source: :user

  has_one :animal
  accepts_nested_attributes_for :animal

  validates :location, presence: true, length: { maximum: 240 }

end
