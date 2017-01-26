class PhotosController < ApplicationController
  before_action :set_photo

  def create
    @photo = @event.photos.new(photo_params)
    @photo.user = current_user
    if @photo.save
      redirect_to @event
    else
      p @photo.errors.messages
      redirect_back(fallback_location: events_path, notice: 'Photo not uploaded')
    end

  end

  def edit
  end

  def destroy
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :description, :picture, :picture_cache)
  end

  def set_photo
    @event = Event.find(params[:event_id])
  end
end
