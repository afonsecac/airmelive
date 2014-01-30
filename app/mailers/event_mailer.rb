class EventMailer < ActionMailer::Base
  default from: "airmelive"

  def participation_email(user,event)
    @event = event
    @user = user
    @url  = 'http://10.6.0.64:4567/upcomingevents/'+@event.id.to_s+'/show'
    mail(to: @user.email, subject: 'Successful Event Registration')
  end
end
