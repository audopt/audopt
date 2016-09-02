class Animal < ActiveRecord::Base

	validates :name, presence: true, length: {maximum: 200}
	validates :kind, presence: true, length: {maximum: 80}
	validates :breed, length: {maximum: 50}
	validates :sex, length: {maximum: 1}
	validates :size, presence: true, length: {maximum: 20}
end
