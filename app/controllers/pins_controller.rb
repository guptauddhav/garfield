class PinsController < ApplicationController
	before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		if params[:tag]
			@pins = Pin.tagged_with(params[:tag]).order("created_at DESC")
		else
			@pins = Pin.all.order("created_at DESC")
		end
	end 

	def show
		@comments = Comment.where(commentable_type: "Pin", commentable_id: @pin.id).order("created_at DESC")
	end 

	def new
		@pin = current_user.pins.build
	end 

	def create
		@pin = current_user.pins.build(pin_params)

		if @pin.save
			redirect_to @pin, notice: "Successfully saved new Pin"
		else 
			render 'new'
		end 
	end 

	def edit 
		render 'edit'
	end 

	def update 
		if @pin.update(pin_params)
			redirect_to @pin, notice: "Pin was succesfully updated"
		else 
			render 'edit'
		end
	end 

	def destroy
		@pin.destroy
		redirect_to root_path
	end 

	def upvote 
		@pin.upvote_by current_user
		redirect_to :back
	end 

	private 

	def pin_params
		params.require(:pin).permit(:title, :description, :image, :price, :tag_list)
	end

	def find_pin 
		@pin = Pin.find(params[:id])
	end 
end
