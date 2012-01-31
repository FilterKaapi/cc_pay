class UsersController < ApplicationController
  def new
  	@user = User.new
  	@title = "Create new alert"
  end

  def create
  	@user = User.create(params[:user])
  	if @user.save
  		redirect_to root_path
  		flash[:success] = "Congratulations! Your payment alert has been created!!"
  	else
  		render :new
  	end
  end

end
