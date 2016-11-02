module NotificationsHelper

  def user_notifications
    Notification.where(receiver: current_user)
  end

  def notification_type notification
    case notification.kind
    when "adoption"
        puts "*"*80
        puts notification.inspect
        puts "*"*80
        # FIXME find a way to go to messages page with user who wants to adopt in parameter
        # FIXME put an if on messages/new, if parameter is empty show select, else show person to send
        link_to notification.content, new_message_path(message_to: notification.sender.name)
    when "report"

    end
  end

  def adopted_message post
    "#{current_user.name} deseja adotar #{post.animal.name}! Envie uma mensagem para #{current_user.name}"
  end

end