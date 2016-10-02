class Post < ActiveRecord::Base

  has_many :comments
  has_many :interest_posts
  has_many :interested_by, through: :interest_posts, source: :user
  has_one :animal
	validates :location, presence: true, length: { maximum: 240 }
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
