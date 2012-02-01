class UsersController < ApplicationController
  def new
  	@user = User.new
  	@title = "Create new alert"
  end

  def create
  	@user = User.create(params[:user])
  	if @user.save
  		redirect_to user_path(@user)
  	else
  		@title = "Create new alert"
  		render :new
  	end
  end

	def show
		@user = User.find(params[:id])
		@title = User.name
	end

end
