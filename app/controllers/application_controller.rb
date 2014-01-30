class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login
  private

=begin
  input : nil
  output : nil
  Check whether the user is logged in or not.
=end 

  def require_login
    if session[:user_id] == nil
      flash[:error] = "You must be logged in to access this section"
      redirect_to index_path and return# halts request cycle
    end
  end
end
