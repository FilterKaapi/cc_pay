class DevelopmentMailInterceptor
	def self.deliverying_email(message)
		message.subject = "#{message.to} #{message.subject}"
		message.to = "sandeep.laxman@gmail.com"
	end
end
