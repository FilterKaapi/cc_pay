class PagesController < ApplicationController
  def home
  	@title = "Home"
  end

  def contact
  	@title = "Contact Us"
  end

  def about
  	@title = "About"
  end

  def alert
  	@title = "Alert Confirmation"
  end

end
