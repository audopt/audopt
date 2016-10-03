class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :report_list, :interest_list]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        login @user
        format.html { redirect_to @user, notice: 'Usuário criado com sucesso.' }
        format.json { render 'show', status: :created }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def report_user
    @report = Report.new
  end

  def reported
    @report = Report.new
    @report.reason = params[:reason]
    @report.user_id = params[:user_id]
    @report.sender = current_user.id

    if @report.save
      redirect_to user_path(User.find(@report.user_id))
    else
      redirect_to report_user_path
    end
  end

  def report_list
    @reports = @user.reports
  end

  def interest_list
    @interested_posts = @user.interests
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :address, :phone, :birth, :password_confirmation, :avatar)
    end
end
