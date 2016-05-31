class PicturesController < ApplicationController
	before_filter :load_pictureable, except: [:show]
	before_action :authenticate_user!
  

	def new 
		@picture = @pictureable.pictures.new
	end 

	def create
		@picture = @pictureable.pictures.new(allowed_params)
		@picture.user_id = current_user.id
		if @picture.save
			redirect_to @pictureable, notice: 'Image was successfully uploaded.'
		else
			render :new
		end
	end 

	def update 
		@picture.update(allowed_params)
	end 

	def show
		@picture = Picture.find(params[:id]) 

	end

	def destroy
		@picture.destroy
		redirect_to :back
	end 


	private

	def allowed_params
		params.require(:picture).permit!
	end

	def load_pictureable
		resource, id = request.path.split('/')[1, 2]
		@pictureable = resource.singularize.classify.constantize.find(id)
	end
end
