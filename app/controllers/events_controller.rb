class EventsController < ApplicationController
before_action :move_to_index, except: [:index, :show]

  def index
    @events = Event.all
    gon.event = @events
  end

  def new
    @events = Event.all
    gon.event = @events
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.valid?
      @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :detail, :event_date, :event_time, :category_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end



end
