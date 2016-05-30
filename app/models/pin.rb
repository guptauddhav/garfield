class Pin < ActiveRecord::Base
	searchkick match: :word_start, searchable: [:title, :description]
	acts_as_votable
	acts_as_taggable
	belongs_to :user
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    has_many :comments, as: :commentable
end
