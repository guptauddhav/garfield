class ReviewsController < ApplicationController
  before_filter :load_reviewable
  before_action :authenticate_user!

  def new 
    @review = @reviewable.reviews.new
  end 

  def create
    @review = @reviewable.reviews.new(allowed_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to @reviewable, notice: 'Review was successfully created.'
    else
      render :new
    end
  end 

  def update 
    @review.update(allowed_params)
  end 

  def destroy
    @review.destroy
    redirect_to :back
  end 

  private

    def allowed_params
      params.require(:review).permit!
    end

    def load_reviewable
      resource, id = request.path.split('/')[1, 2]
      @reviewable = resource.singularize.classify.constantize.find(id)
    end
end
