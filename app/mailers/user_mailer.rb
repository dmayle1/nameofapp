class UserMailer < ActionMailer::Base
	default from: "dmayle012@gmail.com"

	def contact_form(email, name, message)
		@message = message
		mail(:from => email,
			:to => 'dmayle012@gmail.com',
			:subject => "New ActionMail Message from #{name}")
	end
end