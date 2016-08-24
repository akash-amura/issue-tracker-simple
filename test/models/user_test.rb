require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #
  #

  test "email should be unique" do
    u_new = User.new(name:"clark kent",email:"clark.k@example.com",password:"martha",password_confirmation:"martha" ) 
    u_new.save!

    u_new_2 = User.new(name:"clark kent",email:"clark.k@example.com",password:"martha",password_confirmation:"martha" ) 
    assert_not u_new_2.valid?
  end

  test "ask for password confirmation" do
    u_new = User.new(name:"hal jordan",email:"hal.j@example.com",password:"sinestro") 
    assert_not u_new.valid?
  end

  test "store password securely" do
    plain_password = "wally"
    u_new = User.new(name:"barry allen",email:"barry.a@example.com",password:"wallywest",password_confirmation:"wallywest")
    u_new.save!
    barry = User.find_by(email:"barry.a@example.com")
    
    assert_not barry.password == plain_password,'Passwords are the same! Not secure!'
  end 

  test "authenticate users" do
    u = User.new(name:"oliver queen",email:"oliver.q@example.com",password:"felicity",password_confirmation:"felicity") 
    u.save!

    u_new = User.find_by(email:"oliver.q@example.com")
    password = "smoak"
    assert_not u_new.authenticate(password)
  end

  test "email should be in correct format" do

    u = User.new(name:"oliver queen",email:"oliver.q@example.com",password:"felicity",password_confirmation:"felicity") 
    incorrect_emails = ["@example.com","aexample.com","arkham@.com","quinn@example"]
    incorrect_emails.each do |email|
      u.email = email
      assert_not u.valid?,"Failed for #{email}"
    end
  end

  test "Name should be lowercase" do
    u = User.new(name:"Oliver Queen",email:"oliver.q@example.com",password:"felicity",password_confirmation:"felicity") 
    name = "oliver queen"
    u.save
    u_new = User.find_by_email("oliver.q@example.com")
    assert name == u_new.name
  end

end
