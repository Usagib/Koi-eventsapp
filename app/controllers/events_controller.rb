# frozen_string_literal: true

# Events controller
class EventsController < ApplicationController
  # before_action :set_event, only: %i[show edit update destroy event_shedule]
  def new
    @event = Event.new
  end

  def index
    @events = Event.all
    @upcoming = Event.upcoming
    @past = Event.past
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash.now[:sucess] = 'Event created'
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def edit; end

  def show
    @event = Event.find(params[:id])
  end

  def schedule_event
    user = current_user
    @event = Event.find(params[:id])
    @event.attendees << user
    redirect_to user
  end

  def remove_event
    user = current_user
    @event = Event.find(params[:id])
    @event.attendees.delete(user)
    redirect_to user
  end

  def update
    if @event.update(event_params)
      flash[:success] = 'Event updated succesfully!'
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
  end

  private

  def event_params
    params.require(:event).permit(:id, :name, :description, :category,
                                  :location, :event_date, :attendees)
  end

  def set_event
    @event = Event.find(event_params[:id])
  end
end
