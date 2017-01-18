class UserEventsController < ApplicationController
  before_action :authenticate_user!, :set_event

  def create
    @user_event = @event.user_events.where(user_id: current_user.id).first_or_create
    redirect_to @event
  end

  def choose
    @users = User.all.reject{ |user| user == current_user }
  end

  def add
    @user = User.find(params[:user_id])
    @event.users << @user

    redirect_to @event
  end

  def destroy
    @user_event = @event.user_events.where(user_id: current_user.id).destroy_all
    redirect_to events_path
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
