class New < ActiveRecord::Base
	belongs_to :user
	has_many :mementos
end
