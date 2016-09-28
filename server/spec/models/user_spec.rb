require 'rails_helper'

describe User do
  let(:user) { User.new( {user_name: "pete", email: "pete@dbc.com", password: 'secret'})}

  describe "user attributes are valid" do
  	it 'user has a username' do
  		expect(user.user_name).to eq "pete"
  	end

  	it 'user has an valid email' do
  		expect(user.email).to eq "pete@dbc.com"
  	end

  	it 'user has a password' do
  		expect(user.password).to eq "secret"
  	end
  end
end