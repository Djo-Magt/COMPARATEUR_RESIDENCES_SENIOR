class ResidencesController < ApplicationController
  include Pundit::Authorization

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  before_action :set_residence, only: [:show, :edit, :update, :destroy]

  def index
    @residences = policy_scope(Residence)
    @residence = Residence.new
  end

  def show
    @comments = @residence.comments.where.not(id: nil)
    @comment = @residence.comments.new
    authorize @residence
  end


  def create
    @residence = Residence.new(residence_params)
    @residence.user = current_user
    respond_to do |format|
      if @residence.save
        format.html { redirect_to residences_path }
        format.json
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json
      end
    end
    authorize @residence
  end

  def edit
    authorize @residence
  end

  def update
    if @residence.update(residence_params)
      redirect_to residences_path
    else
      render :new, status: :unprocessable_entity
    end
    authorize @residence
  end

  def destroy
    @residence.destroy
    redirect_to residences_path, status: :see_other
    authorize @residence
  end

  private

  def residence_params
    params.require(:residence).permit(:name, :address, :description, :price_per_night, :number_of_guests, photos: [])
  end

  def set_residence
    @residence = Residence.find(params[:id])

  end

end
