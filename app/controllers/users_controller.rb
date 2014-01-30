class UsersController < ApplicationController

	skip_before_action :require_login

=begin 
  redirects to the index page of the application.
=end  

	def index
	end

=begin 
  creates a new user if not registered before.
  if a Google account already exists, then log in with existing account username and password.
=end

	def new
  	user = User.find_by_gplus(params[:gplus])
    if user
    	redirect_to login_details_path(user), notice: "You are already registered!"
  	else
    	@fullname = params[:fullname]
    	@gplusId = params[:gplus]
    	u = User.new(:name => params[:fullname], :gplus => params[:gplus], :email=> params[:email])
    	if u.save
    	 redirect_to login_details_path(u), notice: "User with name #{@fullname} and Google+ ID #{@gplusId} has been successfully registered!"
      else
        render "index"
  	  end
	  end
  end

=begin 
  Profile page of a user visible to all.
=end

  def public_profile
    @user = User.find params[:id]
  end

  private

=begin 
  Strong parameters of User.
=end
    def user_params
      params.require(:user).permit(:name, :gplus, :avatar, :email)
    end
end
