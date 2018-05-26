class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
  	@tweeet = Tweeet.find( params[:tweeet_id])
  	@comment = @tweeet.comments.create(comment_params)
  	@comment.user_id = current_user.id if current_user # assigns logged in user's ID to comment
  	@comment.save!
  	redirect_to tweeet_path(@tweeet)

  end

  def destroy
  	@tweeet = Tweeet.find(params[:tweeet_id])
  	@comment = @tweeet.comments.find(params[:id])
  	@comment.destroy
  	redirect_to tweeet_path(@tweeet)
  end

  private

  def comment_params
  	 params.require(:comment).permit(:name, :response)
  end
end
