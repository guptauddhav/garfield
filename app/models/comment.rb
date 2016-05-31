class Comment < ActiveRecord::Base
	searchkick match: :word_start, searchable: [:description]
	belongs_to :commentable, polymorphic: true
	belongs_to :pin
	belongs_to :user
end
