class NotificationsController < ApplicationController

    def index
        @notifications = user_notifications
    end

end