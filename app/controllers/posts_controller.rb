class PostsController < ApplicationController

  def index
    @all_posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post), notice: "You have successfully submitted a post."
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @response = Response.new
    @messages = Response.where(post_id: @post)
  end


  private

  def post_params
    params.require(:post).permit(:title, :description)
  end

end
