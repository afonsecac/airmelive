class Event < ActiveRecord::Base
	include ImageUpload
	has_many :user_events
	has_many :users, :through => :user_events
	
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates :eventname, :presence => {:message => "can't be empty"},:uniqueness => true, :length => { :in => 2..20 }
	validates :category, :presence => true
	validates :description, :presence => true
	validates :rules, :presence => true

=begin 
  Auto Publish into Facebook.
=end

	def facebook_post
		owner = FbGraph::User.me("CAADLVlmd6d4BAJ8EZBrZC9lcxQvf945umxZCIocJuHXTMO3HZB37WPdogBeWhoeUBnqE8297z32f6Dbkx3DakntN6qdTMP96Uqob67WkdKRkxF6RN7CQiYvVmGxP6akkZAoaiDhuyWnExa91HEQ8ZA3eZAUZCYafEpFeLRntT1ospyDdg7G4gBjjbCcGpZCJv2RUZD")
	    	pages = owner.accounts
		    page = pages.detect do |page|
		      page.identifier == "271138649706896"
		   	end
		   	page.feed!(
		    	:message => 'AirMeLive',
			  	:picture => cloud_url,
			  	:link => 'http://10.6.0.64:4567/upcomingevents/'+ id.to_s+'/show',
			  	:name => eventname,
			  	:description => description
				)
	end
end
