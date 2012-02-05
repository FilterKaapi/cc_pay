ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "everestpartners.in",
  :user_name            => "sandeep.laxman@everestpartners.in",
  :password             => "bunny1234",
  :authentication       => "plain",
  :enable_starttls_auto => true,
  :tls									=> true
}

# ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
