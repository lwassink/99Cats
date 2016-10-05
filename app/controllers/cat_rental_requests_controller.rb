class CatRentalRequestsController < ApplicationController


  def create
    new_rental = CatRentalRequest.create(cat_rental_request_params)
    redirect_to cat_path(new_rental.cat_id)
  end

  def new
    @cats = Cat.all
    render :new
  end

  def approve
    rental = CatRentalRequest.find(params[:id])
    rental.approve!
    @cat = Cat.find(rental.cat_id)

    redirect_to cat_path(rental.cat_id)
  end

  def deny
    rental = CatRentalRequest.find(params[:id])
    rental.deny!
    @cat = Cat.find(rental.cat_id)

    redirect_to cat_path(rental.cat_id)
  end

  private

  def cat_rental_request_params
    params.require(:rental).permit(:cat_id, :start_date, :end_date)
  end
end
