module NotificationsHelper

  def notification_type notification
    case notification.kind
    when "adoption-with-no-message"
      link_to notification.content, new_message_path(message_to: notification.sender.name)
    when "adoption-with-message"
      link_to notification.content, messages_path
    when "report"
      link_to notification.content, reports_list_path(current_user)
    when "comment"
      link_to notification.content, root_path
    end
  end

  def adopted_content post
    "#{current_user.name} deseja adotar #{post.animal.name}! Envie uma mensagem para #{current_user.name}"
  end

  def adopted_with_message_content post
    "#{current_user.name} deseja adotar #{post.animal.name} e enviou uma mensagem! Veja a mensagem que #{current_user.name} enviou"
  end

  def reported_message post
    "Você foi denunciado por #{current_user.name}! Veja aqui a denúncia"
  end

  def comment_message post
    "#{current_user.name} comentou no post do #{post.animal.name}! Vá na sua publicação para ver o que foi comentado"
  end

end