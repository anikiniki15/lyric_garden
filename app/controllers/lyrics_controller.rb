class LyricsController < ApplicationController
  # new と create のみ認証を要求する
  before_action :authenticate_user!, only: [ :new, :create ]

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
    @lyric = Lyric.find(params[:id])
  end

  private

  def lyric_params
    params.require(:lyric).permit(:title, :body, :reference)
  end
end
