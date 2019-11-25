class ArtworksController < ApplicationController

  def index
    user = User.find_by(id: params[:user_id])
    artworks = user.artworks
    shared = user.shared_artworks
    combo = artworks + shared
    render json: combo
  end
  
  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :forbidden
    end
  end

  def destroy
    artwork = Artwork.find_by(id: params[:id])
    if artwork.nil?
      render json: 'Artwork not found', status: :forbidden
    else
      artwork.destroy
      render json: artwork
    end
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :forbidden
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:artist_id, :image_url, :title)
  end
end