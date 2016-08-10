class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


   #acts_as_token_authenticatable
  #field :authentication_token      
    
  
    
     

 # attr_accessible :name, :email, :authentication_token, :password, :encrypted_password

  before_save :ensure_authentication_token

  def ensure_authentication_token
    self.authentication_token ||= generate_authentication_token
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
   has_secure_password  
end
