require 'rails_helper'

RSpec.describe User, type: :model do 
  
  it "is invalid without name" do 
    user = User.new(name:nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without email" do 
    user = User.new(email:nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without correct email format" do
    incorrect_emails = ["ak@gmail","a","ak.com",".com"]
    incorrect_emails.each do |email|
      user = User.new(email:email)
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end
  end

  it "is invalid if email is not unique" do 
    user = User.new(name:"akash",email:"a@example.com",password:"1234567",password_confirmation:"1234567")
    user.save!
    new_user = User.new(name:"a",email:"a@example.com")
    new_user.valid?
    expect(new_user.errors[:email]).to include("has already been taken")
  end


  it "should store password in hash" do
    user = User.new(name:"akash",email:"a@example.com",password:"1234567",password_confirmation:"1234567")
    expect(user.password).to eq("1234567")
    user.save! 
    user = User.find_by(email:"a@example.com")
    expect(user.password).to eq(nil)
  end

  it "should have a password confirmation field" do
    user = User.new(name:"akash",email:"a@example.com",password:"1234567")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("can't be blank")
  end

  it "should save only if the password and confirmation match" do
    user = User.new(name:"akash",email:"a@example.com",password:"1234567",password_confirmation:"1234")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end

  it "should lower name and email field before saving" do 
    user =  User.new(name:"AKASH",email:"A@EXAMPLE.COM",password:"1234567",password_confirmation:"1234567")
    user.save! 
    expect(user.name).not_to eq("AKASH")
    expect(user.email).not_to eq("A@EXAMPLE.COM")
  end
end
