require 'rails_helper'

describe MenusController do

  describe "GET #index" do
    it "renders the :index template" do
    	get :index, {}
    	expect(response).to have_http_status 200
  	end
  end

end