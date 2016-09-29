class User < ActiveRecord::Base
	EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, presence: true, length: {maximum: 200}
	validates :password, length:{minimum: 8}, presence: true
	validates :password_confirmation, length:{minimum: 8}, presence: true
	validates :email, presence: true, format: { with:  EMAIL }, uniqueness: true
	validates :address, presence: true, length: {maximum: 300}
	validates :phone, presence: true
	validates :birth, presence: true

	has_secure_password

	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
		BCrypt::Password.create(string, cost: cost)
	end

end
