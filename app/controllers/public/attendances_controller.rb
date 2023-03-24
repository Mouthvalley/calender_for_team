class Public::AttendancesController < ApplicationController
  before_action :set_schedule

  def new
    @attendance = Attendance.new
    @users = @schedule.shared_users
  end

  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      redirect_to schedule_path(@attendance.schedule), notice: '出欠を更新しました。'
    else
      flash.now[:alert] = '出欠の更新に失敗しました。'
      render 'share_with_attendance'
    end
  end

  def update
    @attendance = @schedule.attendances.find_by(user_id: current_user.id)
    if @attendance.update(attendance_params)
      flash[:success] = "Attendance updated!"
    else
      flash[:error] = "Unable to update attendance."
    end
    redirect_to schedule_path(@schedule)
  end

  def destroy
    @attendance = @schedule.attendances.find_by(user_id: current_user.id)
    @attendance.destroy
    flash[:success] = "Attendance deleted."
    redirect_to schedule_path(@schedule)
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end

  def attendance_params
    params.require(:attendance).permit(:schedule_id, :status).merge(user: current_user)
  end
end
