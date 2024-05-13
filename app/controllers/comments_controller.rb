class CommentsController < ApplicationController
  before_action :set_residence, only: [:create]


  def create
    @comment = Comment.new(comment_params)
    @comment.residence = @residence
    respond_to do |format|
      if @comment.save
        # format.html { redirect_to residence_path(@residence)}
        format.json
      else
        # format.html { render 'residences/show', status: :unprocessable_entity}
        format.json
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to residence_path(@comment.residence), status: :see_other
  end

  private

  def set_residence
    @residence = Residence.find(params[:residence_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
