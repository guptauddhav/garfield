class SearchController < ApplicationController
	
	def index
	end
	
	def results
		@vendors = Vendor.search(params[:query])
		@pins = Pin.search(params[:query])
		@reviews = Review.search(params[:query])
		@comments = Comment.search(params[:query])
	end
end
