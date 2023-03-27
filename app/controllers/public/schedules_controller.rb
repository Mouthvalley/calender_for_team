class Public::SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @schedule = Schedule.new
    # @schedules = Schedule.all.includes(:schedule_shares).order(published_at: :desc)
    @schedules = current_user.schedules.map do |schedule|
      {
        title: schedule.schedule_content,
        start: schedule.schedule_date.iso8601,
        end: schedule.schedule_date.iso8601,
        url: user_schedule_path(current_user, schedule)
      }
    end
    respond_to do |format|
      format.html # index.html.erbを表示する
      format.json { render json: @schedules } # JSONとしてすべてのスケジュールを返す
    end
  end

  def create
    @schedule = current_user.schedules.build(schedule_params) # ログイン中のユーザーに紐づくスケジュールを作成
    if @schedule.save
      redirect_to user_schedules_path, notice: 'スケジュールを作成しました'
    else # 保存に失敗した場合
      flash.now[:alert] = 'スケジュールの作成に失敗しました'
      # @schedules = Schedule.all.includes(:schedule_shares).order(published_at: :desc)
      render :index
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to user_schedules_path(@schedule), notice: 'スケジュールを更新しました'
    else
      render :edit
    end
  end

  def show
    @user = current_user
    @schedule = Schedule.find(params[:id])
    @schedule_share = current_user.schedule_shares.new
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
    redirect_to user_schedules_path, notice: 'スケジュールを削除しました'
  end


  private

  def schedule_params
    params.require(:schedule).permit(:schedule_date, :schedule_content, :published_at)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
    redirect_to user_schedules_path, alert: '他のユーザーのスケジュールにアクセスすることはできません' unless @schedule.user == current_user
  end
end