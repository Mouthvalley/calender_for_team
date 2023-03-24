class Public::ScheduleSharesController < ApplicationController
  before_action :set_schedule, only: [:new, :create, :destroy]

  def new
    @schedule_share = ScheduleShare.new
    @users = User.all
    @user = current_user
    @schedule = Schedule.find(params[:schedule_id])
  end

  #Ver1.0 エラーは出ないけど共有されない
  def create
    @user = current_user
    user_ids = params.dig(:schedule_share, :user_ids) || []
    user_ids.each do |user_id|
      @schedule.schedule_shares.create(user_id: user_id)
    end
    redirect_to user_schedules_path, notice: 'スケジュールを共有しました。'
  end

  def destroy
    @schedule.schedule_shares.where(user_id: params[:user_id]).destroy_all
    redirect_to user_schedule_path(@schedule), notice: '共有を解除しました。'
  end

  def share_with_attendance
    @schedule_share = ScheduleShare.find(params[:id])
    @schedule = @schedule_share.schedule
    @attendance = Attendance.new(schedule: @schedule, user: current_user)
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:schedule_id])
    redirect_to user_schedules_path, alert: '他のユーザーのスケジュールにアクセスすることはできません' unless @schedule.user == current_user
  end
end