class Notification < ActiveRecord::Base

  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'

  validates :content, presence: true
  validates :read, inclusion: { in: [true, false] }

end
