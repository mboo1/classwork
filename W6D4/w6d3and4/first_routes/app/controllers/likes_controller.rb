class LikesController < ApplicationController

  def index
    if params[:comment_id].nil?
      if params[:artwork_id].nil?
        likes = Like.all
        render json: likes
      else
        artwork = Artwork.find_by(id: params[:artwork_id])
        render json: artwork.likes
      end
    else
      comment = Comment.find_by(id: params[:comment_id])
      render json: comment.likes
    end
  end

  def create
    like = Like.new(like_params)
    if like.save
      render json: like
    else
      render json: 'Unlikeable', status: :forbidden
    end
  end

  def destroy
    like = Like.find_by(id: params[:id])
    if like.nil?
      render json: 'Unlikeable', status: :forbidden
    else
      like.destroy
      render json: like
    end
  end



  private

  def like_params
    params.require(:like).permit(:likeable_type, :likeable_id, :user_id)
  end
end