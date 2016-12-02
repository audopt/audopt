class Notification < ActiveRecord::Base

  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'

  validates :content, presence: true
  validates :read, inclusion: { in: [true, false] }

end
