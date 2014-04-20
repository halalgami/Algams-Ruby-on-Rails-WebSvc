class User < ActiveRecord::Base
has_many :api_keys
has_secure_password
validates_presence_of :username, :email, :password, :on => :create
end
