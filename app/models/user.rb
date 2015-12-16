class User < ActiveRecord::Base

    devise :omniauthable

    def self.from_omniauth(auth)
        where(provider: auth["provider"], uid: auth["uid"]).first_or_create do |user|
            user.provider = auth["provider"]
            user.uid = auth["uid"]
            #user.username = auth["info"]["nickname"]
            user.access_token = auth["credentials"]["token"]
            user.access_token_secret = auth["credentials"]["secret"]
        end
    end

    def twitter
        @client ||= Twitter::REST::Client.new do |config|
            config.consumer_key        = Rails.application.secrets.twitter_api_key
            config.consumer_secret     = Rails.application.secrets.twitter_api_secret
            config.access_token        = access_token
            config.access_token_secret = access_token_secret
        end
    end
end
