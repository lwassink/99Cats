class CatsController < ApplicationController
  def index
    render :cats
  end

  def show
    @cat = Cat.find(params[:id])
    render :cat
  end

  def create
    new_cat = Cat.create(cat_params)

    redirect_to cat_path(new_cat)
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update(cat_params)
    render :cat
  end

  def new
    @cat = Cat.new()
    render :new
  end

  private

  def cat_params
    params.require(:cat).permit(:sex, :color, :name, :birth_date, :description)
  end

end
