class AttendeesController < ApplicationController
  def create
    @event = Event.find(params[:id])
    @user = current_user
    @attendee = Attendee.new(event: @event, user: @user)
    if @attendee.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
  end
end
