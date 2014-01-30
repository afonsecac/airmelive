class User < ActiveRecord::Base
	include ImageUpload
	has_many :user_events
	has_many :events, :through => :user_events
	validates :name, :presence => true
	validates :gplus, :uniqueness => true, :presence => true
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/default_profile.jpg"

=begin 
  User details validation.
=end
	def user_details
		if avatar and likes and dislikes and ambition and talent and aboutme != "" or nil
			true
		else
			false
		end	
	end

end
