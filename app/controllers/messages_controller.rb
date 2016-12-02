class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.where(receiver: current_user).order(created_at: :desc)
  end

  def show
  end

  def new
    @message = Message.new
    @message.update(sender: current_user)
    @all_users = User.where.not(name: current_user.name).order(name: :asc)
  end

  def edit
  end

  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Mensagem enviada com sucesso' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params  
      params.require(:message).permit(:text, :receiver_id, :sender_id, :receiver_name)
    end
end   
