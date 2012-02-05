class UserMailer < ActionMailer::Base
	default :from => "sandeep.laxman@everestpartners.in"
	def due_date_mail(user)
		@user = user
		mail(:to => "#{user.name} <#{user.email}>", :subject => "Credit Card Payment")
	end
end
