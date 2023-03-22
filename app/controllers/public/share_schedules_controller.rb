class Public::ShareSchedulesController < ApplicationController

  def create
    @share_schedule = ShareSchedule.new(share_schedule_params)
    if @share_schedule.save
      flash[:success] = "スケジュールを共有しました！"
      redirect_to schedules_path
    else
      flash.now[:error] = "スケジュールの共有に失敗しました"
      render 'index'
    end
  end

  private

  def share_schedule_params
    params.require(:share_schedule).permit(:user_member_id, :schedule_id)
  end
end
