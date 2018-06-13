class UsersController < ApplicationController
  before_action :current_user?, only: [:show, :edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @favorite = current_user.favorites.find_by(sake_id: @sake)
    @favorites_sakes = current_user.favorites
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: "ブログを編集しました。"
    else
      render :edit
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :image)
  end

  def current_user?
    if User.find(params[:id]) != User.find_by(id: session[:user_id])
      redirect_to sakes_path, notice: "権限がありません。"
    end
  end

end
