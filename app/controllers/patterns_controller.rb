class PatternsController < ApplicationController
  def new

  end

  def create
    @pattern = Pattern.new(post_params)
    @pattern.save

    redirect_to @pattern
  end

  def show
    @pattern = Pattern.find(params[:id])
  end

  private
  def post_params
    params.require(:pattern).permit(:title, :pattern)
  end
end
