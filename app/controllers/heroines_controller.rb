class HeroinesController < ApplicationController
  
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
    @power = @heroine.power
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(heroine_params)
    @powers = Power.all
    redirect_to @heroine
  end

  def heroine_params
    params.permit(:name, :super_name, :power_id)
  end

end
