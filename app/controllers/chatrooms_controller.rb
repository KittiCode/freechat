class ChatroomsController < ApplicationController

  def index
    @chatroom = Chatroom.new
    @chatrooms = Chatroom.all
    @users = User.all
  end

  def new
    if request.referrer.split("/").last == "chatrooms"
      flash[:notice] = nil
    end
    @chatroom = Chatroom.new
  end

  

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      respond_to do |format|
        redirect_to chatrooms_path
        # redirect_to @chatroom
        format.js
      end
    else
      respond_to do |format|
        flash[:notice] = {error: ["a chatroom with this topic already exists"]}
        format.html { redirect_to new_chatroom_path }
        format.js { render template: 'chatrooms/chatroom_error.js.erb'} 
      end
    end
  end


  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    # @chatroom.users << current_user
    # ActionCable.server.broadcast 'room_channel',
    #                                onlineuser:  current_user.username
                                   
  end

  private

    def chatroom_params
      params.require(:chatroom).permit(:topic)
    end
end
