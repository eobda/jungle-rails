require 'rails_helper'

RSpec.describe User, type: :model do
  # validates a user with all fields
  it 'successfully saves a new user with all fields entered' do
    user = User.new(
      first_name: 'A',
      last_name: 'B',
      email: 'C@D.com',
      password: 'EEEEEEE',
      password_confirmation: 'EEEEEEE'
    )
    user.save
    expect(user).to be_valid
  end

  # must be created with password and password_confirmation fields
  describe 'Password Validation' do
    it 'returns an error when password is not present' do
      user = User.new(
      first_name: 'A',
      last_name: 'B',
      email: 'C@D.com',
      password: '',
      password_confirmation: ''
    )
      user.save
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'returns an error when password confirmation does not match password' do
      user = User.new(
      first_name: 'A',
      last_name: 'B',
      email: 'C@D.com',
      password: 'EEEEEEE',
      password_confirmation: 'EEE'
    )
      user.save
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  # emails must be unique, NOT case sensitive
  it 'returns an error when email is not unique' do
    user_a = User.new(
      first_name: 'A',
      last_name: 'B',
      email: 'C@D.com',
      password: 'EEEEEEE',
      password_confirmation: 'EEEEEEE'
    )
    user_a.save
    user_b = User.new(
      first_name: 'F',
      last_name: 'G',
      email: 'C@D.com',
      password: 'HHHHHHH',
      password_confirmation: 'HHHHHHH'
    )
    user_b.save
    expect(user_b).to_not be_valid
    expect(user_b.errors.full_messages).to include("Email has already been taken")
  end
  # email, first name, last name all required
end
