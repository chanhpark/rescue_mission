class ResponsesController < ApplicationController
  def new

  end

  def create
    @post = Post.find(params[:post_id])
    @response = Response.new(response_params)
    @response.post_id = params[:post_id]
    @response.save!
    redirect_to @post
  end

  def show

  end

  private

  def response_params
    params.require(:response).permit(:message)
  end
end