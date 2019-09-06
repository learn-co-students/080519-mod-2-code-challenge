class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if !@heroine.valid?
      render :new
    else
      redirect_to @heroine
    end
  end

  def edit
    @heroine = Heroine.find(params[:id])
  end

  def update
    @heroine = Heroine.find_by(name: params[:heroine][:name])
    @heroine.update(heroine_params)
    if !@heroine.valid?
      render :edit
    else
      redirect_to @heroine
    end
  end

  def search
    power = params[:search][:power]
    @heroines = Heroine.find_by_power(power)
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
