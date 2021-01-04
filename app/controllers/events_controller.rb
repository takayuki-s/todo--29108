class EventsController < ApplicationController
before_action :gon_set, only: [:index, :new, :edit]
before_action :move_to_index, except: [:index, :show]
before_action :set_event, only: [:show, :edit, :update, :destroy]
before_action :user_check, only: [:edit, :update, :destroy]

  def index
  end

  def new
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

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    if @event.destroy
      redirect_to root_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :detail, :event_date, :event_time, :category_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def user_check
    redirect_to root_path unless current_user.id == @event.user_id
  end

  def gon_set
    if user_signed_in?
      @events = Event.where(user_id: current_user.id).order(event_date: :asc)
    else
      @events = Event.where(user_id: 1)
    end
      gon.event = @events
  end

end
