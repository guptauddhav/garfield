class Review < ActiveRecord::Base
	belongs_to :reviewable, polymorphic: true
	belongs_to :user
	belongs_to :vendor 
end
