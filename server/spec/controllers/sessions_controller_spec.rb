require 'rails_helper'
require "rspec/json_expectations"

RSpec.describe SessionsController do
	let!(:user) {User.create({user_name: "dbabu", email: "davidbabu@gmail", password: "password"})}
	

  describe "POST #create" do
    
    it "response is valid 200 status code" do
    	post :create, params: {:user => {email:  "davidbabu@gmail", password:  "password"}}
	    expect(response).to have_http_status 200
  	end

  	it "if response is not valid 422 status code" do
  		post :create, params: {:user => {email: '' , password: '' }}
  		expect(response).to have_http_status 422
  	end

  	it "responds with a json object" do 
  		post :create, params: {:user => {email:  "davidbabu@gmail", password:  "password"}}
  		expect(response.body).to include_json(
  			{ response: { user_name: "dbabu",
  				            email: "davidbabu@gmail" } }
  		)
  	end
  end

  describe "DESTROY #delete" do 
  	it "has a session id not equal to nil" do 
  		@user = User.create({user_name: "paul", email: "pauljohn@bob.gil", password: "password"})
  		@user_id = User.last.id
  		session[:user_id] = @user_id
  		expect(session[:user_id]).to eq @user_id

  	end	
  	it "session is set to nil" do 
  		@user = User.create({user_name: "tom", email: "tomjohn@bob.gil", password: "password"})
  		@user_id = User.last.id
  		session[:user_id] = @user_id
  		delete :destroy, {} , { :user_id => @user_id }
  		expect(session[:user_id]).to eq nil
  	end
  end

end