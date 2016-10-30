class Animal < ActiveRecord::Base

  belongs_to :post

  validates :name, presence: true, length: {maximum: 200}
  validates :kind, presence: true, length: {maximum: 80}
  validates :breed, length: {maximum: 50}
  validates :sex, inclusion: { in: ['M', 'F'] }
  validates :size, presence: true, inclusion: { in: ["Pequeno", "Médio", "Grande"] } 
  validates :adopted, inclusion: { in: [true, false] }

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment :avatar, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

end
