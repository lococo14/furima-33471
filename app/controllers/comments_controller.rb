class CommentsController < ApplicationController
  before_action :authenticate_user!

def create
  @comment = Comment.new(comment_params)
  @user = User.find_by(id: current_user.id)
  if @comment.valid?
    @comment.save 
    ActionCable.server.broadcast 'comment_channel', content: @comment , user: @user
  else  
    render "items/show"
  end 
end


private
def comment_params
  params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
end  

end

