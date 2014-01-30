class SessionsController < ApplicationController

	skip_before_action :require_login, only: [:login_details]

=begin 
	input : params[:id]
	Add extra user details other than details fetched from the Google+ account.
	Checks whether the user is admin or not.
=end	

	def login_details
		session[:user_id] = params[:id]
		@user = User.find session[:user_id]
		if @user.email == "airmelive@gmail.com"
			redirect_to admins_path
		elsif @user.user_details
			redirect_to home_path(@user)
		end
	end

=begin
	updates the added details into database.
	updates the edited details into database.
=end

	def update
		@user = User.find(session[:user_id])
    updated = @user.update_attributes(user_params)
  	if updated
  		if @user.avatar_file_name == nil and @user.user_cloud_url == nil
  			@user.update_attribute(:user_cloud_url, "http://ensemble.stanford.edu/assets/default_profile-d80441a6f25a9a0aac354978c65c8fa9.jpg")
	   	elsif @user.avatar_file_name != nil 
				#connecting with AWS cloud
				@file_update = @user.fog(@user.avatar.url)

				@user.update_attribute(:user_cloud_url, @file_update.public_url)
			end
		end

    redirect_to profile_path(@user)
  end
=begin
	finds the user profile.
=end  

  def profile
  	@user = User.find(session[:user_id])
  end

=begin 
	edits the user profile.
=end

  def edit
  	@user = User.find(session[:user_id])
  end

=begin 
	logs out from tthe user account.
=end

  def log_out
  	session[:user_id] = nil
  	redirect_to root_url
  end

	private

=begin 
	Strong parameters of User.
=end
		def user_params
			params.require(:user).permit(:name, :gplus, :age, :city, :country, :avatar, :likes, :dislikes, :ambition, :talent, :aboutme, :mobile, :email)
		end
end
