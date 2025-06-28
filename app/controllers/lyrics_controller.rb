class LyricsController < ApplicationController
  # new, create, edit, update, destroy のみ認証を要求
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :set_lyric, only: [ :show, :edit, :update, :destroy ]
  before_action :correct_user, only: [ :edit, :update, :destroy ]

  def index
    @q = Lyric.ransack(params[:q])
    @lyrics = @q.result.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def new
    @lyric = Lyric.new
  end

  def create
    @lyric = current_user.lyrics.build(lyric_params)

    if @lyric.save
      redirect_to @lyric, notice: "歌詞を投稿しました"
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @lyric.update(lyric_params)
      redirect_to @lyric, notice: "歌詞を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lyric.destroy
    redirect_to lyrics_path, notice: "歌詞を削除しました"
  end

  private

  def set_lyric
    @lyric = Lyric.find(params[:id])
  end

  def correct_user
    unless @lyric.user_id == current_user&.id
      redirect_to root_path, alert: "権限がありません。"
    end
  end

  def lyric_params
    params.require(:lyric).permit(:title, :body, :reference)
  end
end
