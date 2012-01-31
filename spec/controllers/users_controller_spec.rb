require 'spec_helper'

describe UsersController do
	render_views

	describe "GET 'new'" do
		it "should be successful" do
			get :new
			response.should be_success
		end
		it "should have the right title" do
			get :new
			response.should have_selector("title", :content => "Create")
		end
	end

	describe "POST 'create'" do
		describe "failure" do
			before(:each) do
			  @attr = {:name => "", :email => "", :cc_name => "", :due_date => ""}
			end
			it "should have the right title" do
				post :create, :user => @attr
				response.should have_selector("title", :content => "Create")
			end
		end
	end
end
