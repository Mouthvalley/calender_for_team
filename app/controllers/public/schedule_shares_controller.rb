class Public::ScheduleSharesController < ApplicationController
  before_action :set_user
  before_action :set_schedule
  before_action :check_schedule_owner, only: [:new, :create]

  def new
    @schedule = Schedule.find(params[:schedule_id])
    @schedule_share = ScheduleShare.new
    @user = current_user
  end

  def create
    @schedule_share = ScheduleShare.new(schedule_share_params)
    @schedule_share.schedule = @schedule
    if @schedule_share.save
      flash[:success] = "スケジュールを共有しました。"
      redirect_to public_schedule_path(@user, @schedule)
    else
      flash.now[:alert] = "スケジュールの共有に失敗しました。"
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end

  def check_schedule_owner
    unless current_user == @schedule.user
      flash[:alert] = "他人のスケジュールは共有できません。"
      redirect_to public_schedules_path(@user)
    end
  end

  def schedule_share_params
    params.require(:schedule_share).permit(:email)
  end
end