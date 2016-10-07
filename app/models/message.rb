class Message < ActiveRecord::Base

belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
belongs_to :receiver, :foreign_key => :receiver_id, class_name: 'User'


  def receiver_name
    receiver.try(:name)	
  end

  def receiver_name=(name)
    self.receiver = User.find_by_name(name) if name.present?
  end
end
