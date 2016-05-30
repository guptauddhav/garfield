class VendorsController < ApplicationController
	before_action :find_vendor, only: [:show, :edit, :update, :destroy, :upvote]
	before_action :authenticate_user!, except: [:index, :show]
	def index
		if params[:tag]
			@vendors = Vendor.tagged_with(params[:tag]).order("created_at DESC")
		else
			@vendors = Vendor.all.order("created_at DESC")
		end
	end 

	def show
		@reviews = Review.where(reviewable_type: "Vendor", reviewable_id: @vendor.id).order("created_at DESC")
		if @reviews.blank?
			@avg_review = 0
		else
			@avg_review = @reviews.average(:rating).round(2)
		end
	end 

	def new
		@vendor = current_user.vendors.build
	end 

	def create
		@vendor = current_user.vendors.build(vendor_params)

		if @vendor.save
			redirect_to @vendor, notice: "Successfully saved new vendor"
		else 
			render 'new'
		end 
	end 

	def edit 
		render 'edit'
	end 

	def update 
		if @vendor.update(vendor_params)
			redirect_to @vendor, notice: "vendor was succesfully updated"
		else 
			render 'edit'
		end
	end 

	def destroy
		@vendor.destroy
		redirect_to root_path
	end 

	def upvote 
		@vendor.upvote_by current_user
		redirect_to :back
	end 

	private 

	def vendor_params
		params.require(:vendor).permit(:title, :description, :image, :category, :address, :city, :zip, :contact, :email, :phone , :tag_list)
	end
 
	def find_vendor 
		@vendor = Vendor.find(params[:id])
	end 
end
