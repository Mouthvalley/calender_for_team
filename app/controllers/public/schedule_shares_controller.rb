class Public::ScheduleSharesController < ApplicationController
  before_action :set_schedule

  def new
    @schedule_share = ScheduleShare.new
  end

  def create
    @schedule_share = @schedule.schedule_shares.new(schedule_share_params)
    if @schedule_share.save
      redirect_to @schedule, notice: 'スケジュールを共有しました'
    else
      render :new
    end
  end

  def destroy
    @schedule_share = @schedule.schedule_shares.find(params[:id])
    @schedule_share.destroy
    redirect_to @schedule, notice: '共有を解除しました'
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end

  def schedule_share_params
    params.require(:schedule_share).permit(:user_id)
  end
end
