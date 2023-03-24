class Public::ScheduleSharesController < ApplicationController
  before_action :set_schedule

  def new
    @schedule = Schedule.find(params[:schedule_id])
    @users = User.all
    @user = current_user
    @schedule_share = ScheduleShare.new
  end


  def create
    user_ids = params[:schedule_share][:user_ids]
    user_ids.each do |user_id|
      @schedule.schedule_shares.create(user_id: user_id)
    end
    redirect_to user_schedules_path, notice: 'スケジュールを共有しました。'
  end

  def destroy
    @schedule.schedule_shares.where(user_id: params[:user_id]).destroy_all
    redirect_to user_schedule_path(@schedule), notice: '共有を解除しました。'
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end
end