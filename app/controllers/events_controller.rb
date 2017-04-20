class EventsController < ApplicationController
  def index
    @user = current_user
    @events = Event.all
    @local = Event.where(state: @user.state)
    @foreign = Event.where.not(state: @user.state)
  end

  def create
    @user = current_user
    @event = Event.new(name: params[:name], date: params[:date], city: params[:city], state: params[:state], user: @user)
    if @event.save
      redirect_to '/events'
    else
      redirect_to :back
    end
  end

  def show
    @user = current_user
    @event = Event.find(params[:id])
    @attendees = Attendee.where(event: @event.id)

  end

  def comment
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
