class Incident < ActiveRecord::Base
	searchkick match: :word_start, searchable: [:title, :description]
	has_many :pictures, as: :pictureable
	acts_as_taggable
	belongs_to :user
	has_many :comments, as: :commentable
	accepts_nested_attributes_for :pictures, :reject_if => lambda { |p| p['picture'].nil? }
end
