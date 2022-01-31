class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[update destroy toggle_enable_status]

  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    @meetings = Meeting.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      redirect_to meetings_path
    else
      render :new
    end
  end

  def update
    @meeting.update(meeting_params)
    redirect_to meetings_path
  end

  def destroy
    @meeting.destroy
    redirect_to meetings_path
  end

  def toggle_enable_status
    @meeting.toggle!(:is_done)
    redirect_to meetings_path
  end

  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:name, :start_time, :end_time, :user_id, :is_done)
  end
end
