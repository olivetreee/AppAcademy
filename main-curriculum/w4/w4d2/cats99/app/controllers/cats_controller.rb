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

  def create
    new_cat = Cat.new(cat_params)
    if new_cat.save!
      redirect_to cats_url
    else
      flash.now[:errors] = new_cat.errors.full_message
      render :new
    end
  end

  def new
    @cat = Cat.new
    render :new
  end

  def edit
    @cat = Cat.find_by_id(params[:id])

    render :edit
  end

  def update
    @cat = Cat.find_by_id(params[:id])
    unless @cat.nil?
      @cat.update(cat_params)
      redirect_to cats_url
    else
      flash.now[:errors] = new_cat.errors.full_message
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
  end
end
