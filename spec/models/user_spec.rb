require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
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

    describe 'Password Validation' do
      it 'returns an error when password is not present' do
        user = User.new(
        first_name: 'A',
        last_name: 'B',
        email: 'C@D.com',
        password: nil,
        password_confirmation: nil
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

      it 'returns an error when password is less than 7 characters' do
        user = User.new(
        first_name: 'A',
        last_name: 'B',
        email: 'C@D.com',
        password: 'EEEEEE',
        password_confirmation: 'EEEEEE'
      )
        user.save
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Password is too short (minimum is 7 characters)")
      end
    end

    describe 'Email Validation' do
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

      it 'returns an error when same email is entered with different casing' do
        user_a = User.new(
          first_name: 'A',
          last_name: 'B',
          email: 'test@test.COM',
          password: 'EEEEEEE',
          password_confirmation: 'EEEEEEE'
        )
        user_a.save
        user_b = User.new(
          first_name: 'F',
          last_name: 'G',
          email: 'TEST@TEST.com',
          password: 'HHHHHHH',
          password_confirmation: 'HHHHHHH'
        )
        user_b.save
        expect(user_b).to_not be_valid
        expect(user_b.errors.full_messages).to include("Email has already been taken")
      end

      it 'returns an error when email is not present' do
        user = User.new(
        first_name: 'A',
        last_name: 'B',
        email: nil,
        password: 'EEEEEEE',
        password_confirmation: 'EEEEEEE'
      )
        user.save
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Email can't be blank")
      end
    end

    describe "Name Validation" do
      it 'returns an error when first_name is not present' do
        user = User.new(
        first_name: nil,
        last_name: 'B',
        email: 'C@D.com',
        password: 'EEEEEEE',
        password_confirmation: 'EEEEEEE'
      )
        user.save
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("First name can't be blank")
      end

      it 'returns an error when last_name is not present' do
        user = User.new(
        first_name: 'A',
        last_name: nil,
        email: 'C@D.com',
        password: 'EEEEEEE',
        password_confirmation: 'EEEEEEE'
      )
        user.save
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Last name can't be blank")
      end
    end
  end

  describe 'authenticate_with_credentials' do
    it 'successfully authenticates a user' do
      user = User.new(
        first_name: 'A',
        last_name: 'B',
        email: 'C@D.com',
        password: 'EEEEEEE',
        password_confirmation: 'EEEEEEE'
      )
      user.save
      expect(user).to be_valid
      expect(user.authenticate_with_credentials('C@D.com', 'EEEEEEE')).to_not be nil
      expect(user.authenticate_with_credentials('C@D.com', 'EEEEEEE')).to eql(user)
    end

    it 'returns nil if user email does not exist in database' do
      user = User.new(
        first_name: 'A',
        last_name: 'B',
        email: 'C@D.com',
        password: 'EEEEEEE',
        password_confirmation: 'EEEEEEE'
      )
      user.save
      expect(user).to be_valid
      expect(user.authenticate_with_credentials('A@B.com', 'EEEEEEE')).to be nil
    end

    it 'returns nil if user password is incorrect' do
      user = User.new(
        first_name: 'A',
        last_name: 'B',
        email: 'C@D.com',
        password: 'EEEEEEE',
        password_confirmation: 'EEEEEEE'
      )
      user.save
      expect(user).to be_valid
      expect(user.authenticate_with_credentials('C@D.com', 'FFFFFFF')).to be nil
    end
  end
end
