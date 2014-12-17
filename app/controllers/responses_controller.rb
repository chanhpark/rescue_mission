class ResponsesController < ApplicationController
  def new
  end

  def create
    @post = Post.find(params[:post_id])
    @response = Response.new(response_params)
    @response.post_id = params[:post_id]
    if @response.save
      redirect_to @post, notice: "You have successfully submitted a Message."
    else
      render "posts/show"
    end
  end

    def show
    end

  private

  def response_params
    params.require(:response).permit(:message)
  end
end
