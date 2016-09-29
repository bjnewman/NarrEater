require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController do
  subject { response }
		
	describe "POST #create" do
	  it "creates a new user in the database" do	
	    post :create, params: {user: { user_name: "pete", email: "pete@dbc.com", password: 'secret'}}		
	    user = User.find_by_email('pete@dbc.com')
	    expect(user.persisted?).to be(true)
	  end
	  	
	  it "successfully creates user renders json" do
		  post :create, params: {user: { user_name: "jim", email: "jim@dbc.com", password: 'secret'}}	
	  	expect(subject.body).to include_json(
	  		{ response: { user_name: "jim", 
	  									email: "jim@dbc.com" } }
	  	)
	  end

	  it "invalid params, user does not persist" do	
	    post :create, params: {user: { user_name: "pete", email: "petedbc.com", password: 'secret'}}		
	    user = User.find_by_email('petedbc.com')
	    expect(user).to be(nil)
	  end

	  it "failed user create renders 422" do
		  post :create, params: {user: { user_name: "jim", email: "jimdbc.com", password: 'secret'}}
	  	expect(subject).to have_http_status 422
	  end

	  it "failed user create renders 200" do
		  post :create, params: {user: { user_name: "jim", email: "jim@dbc.com", password: 'secret'}}
	  	expect(subject).to have_http_status 200
	  end
	end

	describe "DELETE #destroy" do
		it "user profile is removed from the database" do
			@user = User.create({user_name: "pete", email:'petee@dbc.com', password: 'secret'})
			@user_id = User.last.id
			expect{ 
        delete :destroy, params: {:id => @user_id}
     	}.to change(User, :count).by(-1)
		end  

     	it "deletes user profile renders success JSON" do
     	@user = User.create({user_name: "pete", email:'petee@dbc.com', password: 'secret'})
			@user_id = User.last.id
		  delete :destroy, params: {:id => @user_id}
		  expect(subject.body).to include_json(
		  	{response: "Account successfully removed"}
		 	)
		end
	end
end
