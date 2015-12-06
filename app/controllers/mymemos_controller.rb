class MymemosController < ApplicationController
  include EmojiHelper
  before_action :set_user
  before_action :set_memo, only: [:show, :edit, :update, :destroy]

  def index
    @mymemos = @user.mymemos.all
  end

  def show
  end

  def new
    @mymemo = @user.mymemos.new
  end

  def edit
  end

  def create
    @mymemo = @user.mymemos.new(memo_params)
    respond_to do |format|
      if @mymemo.save
        format.html { redirect_to mymemos_path, notice: "メモ：#{@mymemo.title} を登録しました" }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @mymemo.update(memo_params)
        format.html { redirect_to mymemos_path, notice: "メモ：#{@mymemo.title}  を更新しました" }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @mymemo.destroy
    respond_to do |format|
      format.html  { redirect_to mymemos_path, notice: "メモ：#{@mymemo.title}  を削除しました" }
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_memo
    @mymemo = @user.mymemos.find(params[:id])
  end

  def memo_params
    params.require(:mymemo).permit(:title, :text)
  end
end
