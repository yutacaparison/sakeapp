class SakesController < ApplicationController

  before_action :set_sake, only: [:show, :edit, :update, :destroy]
  before_action :login?, only: [:create, :new, :edit, :show, :destroy]
  before_action :current_user?, only: [:edit, :destroy]

  def index
    @sakes = Sake.all
  end

  def new
    if params[:back]
      @sake = Sake.new(sake_params)
    else
      @sake = Sake.new
    end
  end

  def edit
  end

  def create
    @sake = Sake.new(sake_params)
    @sake.user_id = current_user.id
    if @sake.save
      redirect_to sakes_path, notice: "日本酒ノートを投稿しました。"
    else
      render 'new'
    end
  end

  def show
    @favorite = current_user.favorites.find_by(sake_id: @sake)
    @favorites_sakes = current_user.favorites
  end

  def update
    @sake = Sake.find(params[:id])
    if @sake.update(sake_params)
      redirect_to sakes_path, notice: "日本酒ノートを編集しました。"
    else
      render 'edit'
    end
  end

  def destroy
    @sake.destroy
    redirect_to sakes_path, notice: "日本酒ノートを削除しました。"
  end

  def confirm
    @sake = Sake.new(sake_params)
    @sake.user_id = current_user.id
    render :new if @sake.invalid?
  end


  private

  def sake_params
    params.require(:sake).permit(:sake, :brewery, :prefectures, :image, :image_cache, :comment)
  end

  def set_sake
    @sake = Sake.find(params[:id])
  end

  def login?
    if current_user.nil?
      redirect_to new_session_path, notice: "ログインしてください。"
    end
  end

  def current_user?
    if @sake.user_id != current_user.id
      redirect_to sake_path, notice: "権限がありません。"
    end
  end

end
