class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def search
    search_term = params.permit(:q).values[0]
    search_terms = search_term.split(/\s/)
    @heroines = Heroine.all.to_a
    search_terms.each do |term|
      @heroines.delete_if{|heroine| !(/#{term}/i.match(heroine.power.name))}
    end
    render :index
  end

  def show
    @heroine = Heroine.find(params[:id])
    @power = @heroine.power
  end

  def new
    @heroine = Heroine.new
  end 
  
  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end

  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
