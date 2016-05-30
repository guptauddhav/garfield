class Review < ActiveRecord::Base
	searchkick match: :word_start, searchable: [:comment]
	belongs_to :reviewable, polymorphic: true
	belongs_to :user
	belongs_to :vendor 
end
