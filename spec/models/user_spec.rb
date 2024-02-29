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
      password_confirmation: 'EEEEEEE'
    )
    expect(user).to_not be_valid
    expect(user.errors.full_messages).to include("Password can't be blank")
    end
  end
  # emails must be unique, NOT case sensitive
  # email, first name, last name all required
end
