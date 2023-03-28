class Public::SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @schedule = Schedule.new
    @schedules = Schedule.all.includes(:schedule_shares).order(published_at: :desc)
    # シンプルカレンダーで使用するためのハッシュの配列を作成
  #   @calendar_events = @schedules.map do |schedule|
  #     {
  #       id: schedule.id,
  #       title: schedule.content,
  #       start: schedule.start_time.to_datetime # DateTimeオブジェクトに変換する
  #     }
  #   end

  #   @calendar_options = {
  #     events: @calendar_events # ハッシュの配列を渡す
  #   }
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
    params.require(:schedule).permit(:schedule_date, :schedule_content, :published_at, :title, :content, :start_time)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
    redirect_to user_schedules_path, alert: '他のユーザーのスケジュールにアクセスすることはできません' unless @schedule.user == current_user
  end
end