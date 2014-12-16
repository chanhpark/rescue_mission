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
      redirect_to post_path(@post), notice: "you have successfully submitted a post"

    elsif @post.title.empty? && @post.description.empty?
      flash[:notice] = "Please provide a title and description"
      redirect_to new_post_path(@post)

    elsif @post.title.empty?
      flash[:notice] = "you must provide a title"
      redirect_to new_post_path(@post)

    else @post.description.empty?
      flash[:notice] = "you must provide a description"
      redirect_to new_post_path(@post)
    end
  end

  def show
    @post = Post.find(params[:id])
  end


  def post_params
    params.require(:post).permit(:title, :description)
  end
end
