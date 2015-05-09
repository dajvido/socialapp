class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.order('created_at DESC')
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params.merge({ user: current_user }))

    if @message.save
      redirect_to messages_path
    else
      render :new
    end
  end

  def destroy
    @message = Message.find(params[:id])
    if @message.user == current_user
      flash[:success] = 'Message deleted successfully'
      @message.destroy
    else
      flash[:error] = 'You can\'t delete message sent by someone else'
    end
    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
