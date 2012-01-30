class UsersController < ApplicationController
  def new
  	@user = user.new
  	@title = "Sign up"
  end

end
