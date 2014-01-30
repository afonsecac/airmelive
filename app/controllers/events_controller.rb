class EventsController < ApplicationController

	skip_before_action :require_login, except: [:post_upcoming_events]
	
=begin
	Action home provides details for the home page of the application.
	@up_events and @on_events are used to select the upcoming and 
	on going events respectively.	
=end

	def home
		if session[:user_id]
			@user = User.find session[:user_id]
		end
		@users = User.where('email != ?','airmelive@gmail.com').sort
		@date_today = DateTime.now.utc
		@up_events = Event.where('registrationopen <= ? and registrationclose > ?',@date_today,@date_today)
		@on_events = Event.where('eventopen <= ? and eventclose > ?',@date_today,@date_today)
	end

=begin
	upcoming_events action selects up coming events by comparing their date details
	with system date and store the events in @events.		
=end

	def upcoming_events
		if session[:user_id]
			@user = User.find session[:user_id]
		end
		@date_today = DateTime.now.utc
		@events = Event.where('registrationopen <= ? and registrationclose > ?',@date_today,@date_today)
	end

=begin
	ongoing_events action selects up coming events by comparing their date details
	with system date and store the events in @events.		
=end
	def ongoing_events
		if session[:user_id] 
			@user = User.find session[:user_id]
		end
		@date_today = DateTime.now.utc
		@events = Event.where('eventopen <= ? and eventclose > ?',@date_today,@date_today)
	end

=begin
	input : params[:id]
	for showing each upcoming event page.
=end	
	def show_up
		@event = Event.find(params[:id])
		@users = @event.users
		if session[:user_id]
			@user = User.find(session[:user_id])
		end
	end
=begin 
	Provide the option to participate in each upcoming event.
	Sends a confirmation mail to each user on participation.
=end
	def post_upcoming_events
		@user = User.find(session[:user_id])
		@event = Event.find(params[:id])
		check = UserEvent.where('user_id = ? and event_id = ?',session[:user_id], params[:id])
		
		if check.empty?
			user_event = UserEvent.create(user_id: session[:user_id],event_id: params[:id])				
			EventMailer.participation_email(@user,@event).deliver
			redirect_to upcoming_each_path(@event), :notice => "You have successfully registered"
		else
				flash[:notice] = 'You have already registered for this event'
		end
	end
end
