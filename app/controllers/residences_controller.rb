class ResidencesController < ApplicationController
  before_action :set_residence, only: [:show, :edit, :update, :destroy]

  def index
    @residences = Residence.all
    @residence = Residence.new
  end

  def show
    @comments = @residence.comments.where.not(id: nil)
    @comment = @residence.comments.new
  end


  def create
    @residence = Residence.new(residence_params)

    respond_to do |format|
      if @residence.save
        format.html { redirect_to residences_path }
        format.json
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json
      end
    end
  end

  def edit
  end

  def update
    if @residence.update(residence_params)
      redirect_to residences_path
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
