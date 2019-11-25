class CommentsController < ApplicationController

  def index
    if params[:user_id].nil?
      if params[:artwork_id].nil?
        comments = Comment.all
        render json: comments
      else
        artwork = Artwork.find_by(id: params[:artwork_id])
        render json: artwork.comments
      end
    else
      user = User.find_by(id: params[:user_id])
      render json: user.comments
    end
  end

  def create
    comment = Comment.create(comment_params)
    if comment.save
      render json: comment
    else
      render json: 'Invalid comment', status: :forbidden
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    if comment.nil?
      render json: 'Invald comment', status: :forbidden
    else
      comment.destroy
      render json: comment
    end  
  end



  private

  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end

end