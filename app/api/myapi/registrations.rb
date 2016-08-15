 
class Myapi::Registrations < Grape::API
version 'v1', using: :header, vendor: 'myapi'
 format :json
 prefix :api
 
 
  

 params do
     requires :name, type: String, desc: "Name user"
     requires :email, type: String, desc: "User email"
     requires :password, type: String, desc: "User Password"
   end


   
  get '/rk' do

    user = User.new
    user.name = params[:name]
    user.email = params[:email]
    user.password = params[:password]
    user.password_confirmation = params[:password]
    if user.save
      
#    render(json: "fdsfdsfd" ) 
     {status: 'ok', token: user.authentication_token}.to_json
#      render json: user.as_json(auth_token: user.authentication_token, email: user.email), status: :created
      
    else
     # warden.custom_failure!
   #   render json: user.errors, status: :unprocessable_entity
    
      error!({ status: 'error', error: user.errors })
    end
  end
 
end