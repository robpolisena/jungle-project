require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new({
    first_name: 'John',
    last_name: 'Smith',
    email: 'jsmith@gmail.com',
    password: 'test123',
    password_confirmation: 'test123'
  })
  user.save

  describe 'Validations' do

    it "Saves a user when the passwords match" do
      find_user = User.where(first_name: 'John')
      puts "Find user: #{find_user.inspect}"
      expect(find_user).to exist
    end

    it "Don't save user when passwords don't match" do
      user = User.new({
        first_name: 'Melissa',
        last_name: 'Wells',
        email: 'mwells@gmail.com',
        password: 'test123',
        password_confirmation: 'test23'
      })
      user.save

      find_user = User.where(first_name: 'Melissa')
      puts "Find user: #{find_user.inspect}"
      expect(find_user).not_to exist
    end

    it "Don't save a user if their email is not unique" do
      user = User.new({
        first_name: 'Mary',
        last_name: 'Wells',
        email: 'MWELLS@gmail.com',
        password: 'test123',
        password_confirmation: 'test'
      })
      user.save

      find_user = User.where(first_name: 'Mary')
      puts "Find user: #{find_user.inspect}"
      expect(find_user).not_to exist
    end

    it "Doesn't save a user when the password is less than 6 characters" do
      user = User.new({
        first_name: 'Amy',
        last_name: 'Pat',
        email: 'amypat@gmail.com',
        password: 'test',
        password_confirmation: 'test'
      })
      user.save

      find_user = User.where(first_name: 'Amy')
      puts "Find user: #{find_user.inspect}"
      expect(find_user).not_to exist
    end
  end
  
  describe '.authenticate_with_credentials'  do
    it "logs in with correct email and password"  do
      check_user = User.authenticate_with_credentials('jsmith@gmail.com', 'test123')
      puts "User check: #{check_user}" 
    end
    it "removes whitespace from emails"  do
      check_user = User.authenticate_with_credentials('    jsmith@gmail.com   ', 'test123')
      puts "User check: #{check_user.inspect}" 
    end
  end
end
