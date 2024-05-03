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

  end

  def edit
  end

  def update
  end

  def destroy
    @residence.destroy
    redirect_to residences_path, status: :see_other
  end

  private

  def residence_params
  end

  def set_residence
    @residence = Residence.find(params[:id])
  end

end
