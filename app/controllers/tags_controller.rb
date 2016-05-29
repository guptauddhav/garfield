class TagsController < ApplicationController
	
	def index
		@tags = ActsAsTaggableOn::Tag.all
	end

	def show
		if params[:tag]
			@vendors = Vendor.tagged_with(params[:tag]).order("created_at DESC")
			@pins = Pin.tagged_with(params[:tag]).order("created_at DESC")
		else
			@vendors = Vendor.all.order("created_at DESC")
			@pins = Pin.all.order("created_at DESC")
		end
	end 



end
