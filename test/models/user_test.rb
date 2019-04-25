require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(email: "john.smith@ymail.com", password: "12345678", password_confirmation: "12345678", fname: "John", lname: "Smith", gender: :male, dob: "1989-05-22")
  end
  
  test "user must be valid" do
    assert @user.valid?
  end
  
  test "lname cannot be blank" do
    @user.lname = ""
    assert_not @user.valid?
  end 
  
  test "fname cannot be blank" do
    @user.fname = ""
    assert_not @user.valid?
  end 
  
  test "email cannot be blank" do 
    @user.email = ""
    assert_not @user.valid?
  end
  
  test "email must be unique" do
    attr = {email: "john.smith@ymail.com", password: "12345678", password_confirmation: "12345678", fname: "John", lname: "Smith", gender: :male, dob: "1989-05-22"}
    assert user = User.new(attr)
    assert user.invalid?
    assert user.errors.include?(:email)
  end
  
  test "email must be a valid format for an email address" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?
    end
  end

end
