class EventsController < ApplicationController
  def index
    @events = Event.all
    gon.events = @events
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :detail, :event_date, :start_date, :end_date, :category_id)
  end


end
