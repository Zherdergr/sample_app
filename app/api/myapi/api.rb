 module Myapi
  class Myapi::API < Grape::API
    version 'v1', using: :header, vendor: 'myapi'
    format :json
    prefix :api

     rescue_from :all, backtrace: true
      # error_formatter :json, ErrorFormatter

       before do
          error!("401 Unauthorized, 401") unless authenticated
       end

  helpers do
    def warden
      env['warden']
    end

    def authenticated
      return true if warden.authenticated?
      params[:access_token] && @user = User.find_by_authentication_token(params[:access_token])
    end

    def current_user
      warden.user || @user
    end
  end


	 resource :hello do
      desc 'Return a public timeline.'
        get :hh do
      # return User.to_json
      #{@user.as_json}
       {:success=>true, :email=>@user.email, :name=>@user.name}
     # { hello: 'world' }
   
     end
    end
 
    


   end




end