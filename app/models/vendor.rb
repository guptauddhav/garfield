class Vendor < ActiveRecord::Base
	acts_as_votable
	acts_as_taggable
	belongs_to :user
	has_many :reviews, as: :reviewable
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
