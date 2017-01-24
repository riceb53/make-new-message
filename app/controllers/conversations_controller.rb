class ConversationsController < ApplicationController
 before_action :authenticate_user
def index
  # commentario
  if current_user.instance_of? Guy
    @users = Girl.all
  else
    @users = Guy.all
  end
  # commentario
 @conversations = Conversation.all
 end
def create
 if Conversation.between(params[:girl_id],params[:guy_id])
   .present?
    @conversation = Conversation.between(params[:girl_id],
     params[:guy_id]).first
 else
  p conversation_params
  @conversation = Conversation.create!(conversation_params)
 end
 redirect_to conversation_messages_path(@conversation)
end
private
 def conversation_params
  params.permit(:girl_id, :guy_id)
 end
end
