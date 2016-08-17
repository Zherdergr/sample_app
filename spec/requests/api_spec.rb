 
 
require 'spec_helper'

describe 'Myapi::API' do
    before do
     @user= FactoryGirl.create(:user) 
     @user.save
    end 
  
  it 'Unauthored access' do  
	get '/api/hello' 
#	expext_json(error: '401 Unauthorized, 401')
     expect(json).to have_key('error') 
  #   expect(json["error"]).to be == "401 Unauthorized, 401"
   end	

  it 'hello invalid token' do
  	 #@user.authentication_token should be_blank
     
     get '/api/hello?access_token=11' 
     expect(json).to have_key('error')  
    # expect(json).to be == 'success' + @user.authentication_token
  end	
  it 'hello valid token' do
     get '/api/hello?access_token='+@user.authentication_token 
     expect(json["status"]).to be == "ok" 
     expect(json["name"]).to be == @user.name
  end
end


describe 'Myapi::Sessions' do
    before do
     @user= FactoryGirl.create(:user) 
     
    end 

    it 'get sessions valid by email' do

       get '/s/api/sessions/hhh?email='+@user.email+'&password='+@user.password
       expect(json["status"]).to be == "ok"
    end	
 end   