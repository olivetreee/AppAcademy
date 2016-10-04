class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find_by_id(params[:id])
    if @cat.nil?
      render text: "Cat doesn't exist"
    else
      render :show
    end
  end
end
