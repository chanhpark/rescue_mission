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
    else
      flash[:notice] = "NOOOOOOO"
    end
  end

  def show
    @post = Post.find(params[:id])
  end


  def post_params
    params.require(:post).permit(:title, :description)
  end
end
