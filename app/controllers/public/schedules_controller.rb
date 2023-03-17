class Public::SchedulesController < ApplicationController
  before_action :set_schedule, only: [:edit, :update]

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to schedules_path, notice: 'スケジュールを作成しました'
    else
      render :new
    end
  end

  def index
    @schedules = Schedule.all.order(published_at: :desc)
  end

  def edit
    # @schedule = Schedule.find(params[:id])
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to schedule_path(@schedule), notice: 'スケジュールを更新しました'
    else
      render :edit
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to schedules_path, notice: 'スケジュールを削除しました'
  end

  private

  def schedule_params
    params.require(:schedule).permit(:schedule_date, :schedule_content, :published_at)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end
