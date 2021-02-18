class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @new_flat = Flat.new
  end

  def create
    strong_params = params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
    @new_flat = Flat.new(strong_params)
    if @new_flat.save
      redirect_to flat_path(@new_flat)
    else
      render :new
    end
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    strong_params = params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
    @flat = Flat.update(strong_params)

    if @flat.save
      redirect_to show_flat_path(@flat)
    else
      render :edit
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    Flat.destroy(@flat)
  end
end
