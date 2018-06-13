class BlogsController < ApplicationController

  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :login?, only: [:create, :new, :edit, :show, :destroy]
  before_action :current_user?, only: [:edit, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path, notice: "ブログを作成しました。"
    else
      render :new
    end
  end

  def show
    @comment = @blog.comments.build
    @comments = @blog.comments
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました。"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "ブログを削除しました。"
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end


  private

  def blog_params
    params.require(:blog).permit(:title, :content, :image, :image_cache)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def login?
    if current_user.nil?
      redirect_to new_session_path, notice: "ログインしてください。"
    end
  end

  def current_user?
    if @blog.user_id != current_user.id
      redirect_to blog_path, notice: "権限がありません。"
    end
  end

end
