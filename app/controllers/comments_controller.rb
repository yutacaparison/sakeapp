class CommentsController < ApplicationController

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.build(comment_params)
    @comment.name = current_user.name

    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to blog_path(@blog), notice: '投稿できませんでした。' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:blog_id, :name, :content)
  end

end
