require 'spec_helper'

describe User do
  before(:each) do
    @attr = { :name => "Example User", :email => "user@example.com", :cc_name => "ABC Card", :due_date => "24"}
  end
	it "should create a user with appropirate attributes" do
		User.create!(@attr)
	end
	it "should require a name" do
		no_name_user = User.new(@attr.merge(:name => ""))
		no_name_user.should_not be_valid
	end
	it "should require an email" do
		no_email_user = User.new(@attr.merge(:email => ""))
		no_email_user.should_not be_valid
	end
	it "should reject long names" do
		long_name="a"*51
		long_name_user = User.new(@attr.merge(:name => long_name))
		long_name_user.should_not be_valid
	end
	it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email=>address))
      invalid_email_user.should_not be_valid
    end
  end
	it "should reject duplicate email addresses" do
    #Put a user with given email address into the database
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  it "should require a credit card name" do
  	no_cc_user = User.new(@attr.merge(:cc_name => ""))
  	no_cc_user.should_not be_valid
  end
  it "should require a due date" do
  	no_due_date = User.new(@attr.merge(:due_date => ""))
  	no_due_date.should_not be_valid
  end
  it "should reject non integer dude dates" do
  	due_dates = %w[189.5 san 0.da]
  	due_dates.each do |due_date|
  		invalid_due_date_user = User.new(@attr.merge(:due_date => due_date))
  		invalid_due_date_user.should_not be_valid
  	end
  end
  it "should reject due dates greater than 31 or less than 1" do
  	due_dates = %w[0 32 -5]
  	due_dates.each do |due_date|
  		invalid_due_date_user = User.new(@attr.merge(:due_date => due_date))
  		invalid_due_date_user.should_not be_valid
  	end
  end
  it "should accept due dates between 1..31" do
  	due_dates = %w[1 2 30 31]
  	due_dates.each do |due_date|
  		valid_due_date_user = User.new(@attr.merge(:due_date => due_date))
  		valid_due_date_user.should be_valid
  	end
  end
end
