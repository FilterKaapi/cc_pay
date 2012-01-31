class User < ActiveRecord::Base
	attr_accessible :name, :email, :cc_name, :due_date

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name , :presence => true, :length => {:maximum => 50}
	validates :email, :presence => true, :format => {:with => email_regex},
										:uniqueness => {:case_sensitive => false}
	validates :cc_name, :presence => true
	validates :due_date, :presence => true, :numericality => {:only_integer => true, :greater_than => 0, :less_than => 32}
end
