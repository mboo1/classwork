
class ArtworkSharesController < ApplicationController

  def create
    artshare = ArtworkShare.new(artwork_shares_params)
    if artshare.save
      render json: artshare
    else
      render json: artshare.errors.full_messages, status: :forbidden
    end
  end

  def destroy
    artshare = ArtworkShare.find_by(id: params[:id])
    if artshare.nil?
      render json: "Like does not exist", status: :forbidden
    else
      artshare.destroy
      render json: artshare
    end
  end

  def index
    artshare = ArtworkShare.all
    render json: artshare
  end

  private

  def artwork_shares_params
    params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
  end

end