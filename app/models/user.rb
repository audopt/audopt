class User < ActiveRecord::Base

  has_many :articles
  has_many :reports, dependent: :destroy
  has_many :interest_posts
  has_many :interests, through: :interest_posts, source: :post
  has_many :posts, dependent: :destroy
  has_many :send_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :receive_messages, class_name: 'Message', foreign_key: 'receiver_id'
  has_many :notifications, class_name: 'Notification', foreign_key: 'receiver_id'
  has_many :adopted_animals, class_name: 'Animal', foreign_key: 'adopter_id'

  EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 200 }
  validates :password, length:{ minimum: 8 }, presence: true
  validates :password_confirmation, length: { minimum: 8 }, presence: true
  validates :email, presence: true, format: { with: EMAIL }, uniqueness: true
  validates :address, presence: true, length: { maximum: 300 }
  validates :phone, presence: true
  validates :birth, presence: true

  has_secure_password
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Password.create(string, cost: cost)
  end

end
