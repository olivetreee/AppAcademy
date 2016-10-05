class CatRentalRequestsController < ApplicationController
  def new
    @cats = Cat.all
    @rental_requests = CatRentalRequest.new
    render :new
  end

  def create
    new_rental_request = CatRentalRequest.new(rental_params)
    if new_rental_request.save!
      redirect_to cats_url
    else
      flash.now[:errors] = new_cat.errors.full_message
      render :new
    end
  end

  def rental_params
    params.require(:rental).permit(:cat_id, :start_date, :end_date, :status)
  end
end
