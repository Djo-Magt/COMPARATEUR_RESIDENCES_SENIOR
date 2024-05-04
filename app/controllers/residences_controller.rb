class ResidencesController < ApplicationController
  before_action :set_residence, only: [:show, :edit, :update, :destroy]

  def index
    @residences = Residence.all
  end

  def show
  end

  def new
    @residence = Residence.new
  end

  def create
    @residence = Residence.new(residence_params)
    if @residence.save
      redirect_to residence_path(@residence)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if residence.update(residence_params)
      redirect_to residence_path(@residence)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @residence.destroy
    redirect_to residences_path, status: :see_other
  end

  private

  def residence_params
    params.require(:residence).permit(:name, :address, :description, :price_per_night, :number_of_guests, photos: [])
  end

  def set_residence
    @residence = Residence.find(params[:id])
  end

end
