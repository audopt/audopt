class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login user
			redirect_to posts_path
    else
      render 'new'
    end
  end

  def destroy
    if current_user
      log_out
    end
    redirect_to root_path
  end

end
