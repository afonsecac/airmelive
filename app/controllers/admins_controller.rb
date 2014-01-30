=begin
	creates an event.
	autopublishes the event creation into facebook.
	edits the event.
	lists the whole events.
=end

class AdminsController < ApplicationController	

=begin
	input : nil
	output : @event
	creates a new object of Event.
=end	

	def index
		@event = Event.new
	end


=begin
	input : @event
	output : nil
	creates an event and autopublishes into facebook.
=end

	def create
		@event = Event.new(event_params)
		event_save = @event.save
		if event_save
			if @event.avatar_file_name == nil
				@event.update_attribute(:cloud_url, "http://1.bp.blogspot.com/_aweQ2selVdQ/TGoLGotyQsI/AAAAAAAAAEE/Ww3KEchuwGM/s1600/No+Cover.jpg")
			else
			#connecting with AWS cloud
			@file = @event.fog(@event.avatar.url)

			@event.update_attribute(:cloud_url, @file.public_url)
      end
			#autopublishing into facebook
			@event.facebook_post
		else
			err_msg = @event.errors.full_messages
		end
		redirect_to admins_path(@event), :notice => err_msg
	end

=begin 
	input : nil
	output : @upcoming_events, @ongoing_events
	finds the upcoming and ongoing events.
=end	

	def show
		@event_list = Event.all
		@date_today = DateTime.now.utc
		@upcoming_events = Event.where('registrationopen <= ? and registrationclose > ?',@date_today,@date_today)
		@ongoing_events = Event.where('eventopen <= ? and eventclose > ?',@date_today,@date_today)
		@auditioning_events = Event.where('auditionopen <= ? and auditionclose > ?',@date_today,@date_today)
	end

=begin
	input : nil
	output : @event, @users
	Managing audition through hangout air.
=end

	def audition
		@event = Event.find(params[:id])
		@users = @event.users
	end

=begin
	input : nil
	output : @event_edit
	edits the event.
=end

	def edit_event
    	@event_edit = Event.find(params[:id])
  	end

=begin
	input : nil
	output : nil
	updates edited event details in the database.
=end    

	
	def update
    	@event = Event.find(params[:id])
    	if @event.update_attributes(event_params)
    		if @event.avatar_file_name != nil
				#connecting with AWS cloud
				@file_edit = @event.fog(@event.avatar.url)

				@event.update_attribute(:cloud_url, @file_edit.public_url)
			end
	    	redirect_to show_path(@event)
    	else
      		render ('edit')
    	end
  	end

=begin
	input : nil
	output : nil
	Deleting events in the database.
=end 

  def delete
  	@event = Event.find(params[:id])
  	@event.destroy
  	redirect_to show_path
  end

=begin
	input : nil
	output : nil
	fetch hangout url via ajax call from hangout api and save to database.
=end 

  def save_json_data
  	render :json => {:data => {:hang_out_url => params[:hangoutUrl], :topic => params[:topic]}}
  	@user = User.find(params[:id])
  	@user.update_attributes(hangouturl: params[:hangoutUrl])
  end

private

=begin
	input : nil
	output : nil
	Strong paramaters of events.
=end 

    def event_params
      params.require(:event).permit(:eventname, :category, :registrationopen, :registrationclose, :auditionopen, :auditionclose, :eventopen, :eventclose, :description, :rules,:avatar)
    end
end
