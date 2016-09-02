class Comment < ActiveRecord::Base

	belongs_to :post

	validates :text, presence: true, length: { maximum: 240 }

end
