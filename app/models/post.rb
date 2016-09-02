class Post < ActiveRecord::Base

	has_many :comments

	validates :text, presence: true, length: { maximum: 240 }
	validates :location, presence: true, length: { maximum: 240 }

end
