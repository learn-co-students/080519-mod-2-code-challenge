class HeroinesController < ApplicationController
  def index
    #feed search method by default when loading index
    @heroines = Heroine.search(params[:search])
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :search)
  end

end
