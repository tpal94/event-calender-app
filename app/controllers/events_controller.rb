class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events ||= Event.where(start: params[:start]..params[:end])
  end

  def my_events
    @events = current_user.events
    render "index"
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  def update
    @event.update(event_params)
  end

  def destroy
    @event.destroy
  end

  def my_calender
    
  end

  def join_event
    @event = Event.find_by_id(params[:event_id])
    @attendee = Attendee.create(attendee_params)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :end, :color,:user_id)
    end

    def attendee_params
      params.permit(:event_id,:user_id)
    end
end
