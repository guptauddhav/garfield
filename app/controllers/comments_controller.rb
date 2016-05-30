class CommentsController < ApplicationController
  before_filter :load_commentable, except: [:show]
  before_action :authenticate_user!
  

  def new 
    @comment = @commentable.comments.new
  end 

  def create
    @comment = @commentable.comments.new(allowed_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @commentable, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end 

  def update 
    @comment.update(allowed_params)
  end 

  def show
    @comment = Comment.find(params[:id]) 
  end

  def destroy
    @comment.destroy
    redirect_to :back
  end 

  private

    def allowed_params
      params.require(:comment).permit!
    end

    def load_commentable
      resource, id = request.path.split('/')[1, 2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end
end
