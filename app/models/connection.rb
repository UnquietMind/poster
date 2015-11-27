class Connection < ActiveRecord::Base
    belongs_to :user
    
    def self.create_from_omniauth(auth_hash)
        create! do |connection| 
            connection.provider= auth_hash.provider 
            connection.oauth_token= auth_hash.credentials.token 
            connection.secret= auth_hash.credentials.secret
        end
    end
end
