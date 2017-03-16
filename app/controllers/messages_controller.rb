class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    @chatroom = Chatroom.find_by_id(params[:message][:chatroom_id])
    message.user = current_user
    if message.save
      # redirect_to chatrooms_path(params[:message][:chatroom_id])
      redirect_to @chatroom
    else 
      redirect_to new_chatroom_path
    
    
    end
  end

  private

    def message_params
      params.require(:message).permit(:content, :chatroom_id)
      # params.require(:message).permit(:content, :chatroom_id)
    end
end
