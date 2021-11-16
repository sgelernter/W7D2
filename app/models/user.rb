class User < ApplicationRecord

    validates :email, :password_digest, :session_token, presence: true 
    validates :email, :session_token, uniqueness: true 
    validates :password, length: {minimum: 6}, allow_nil: true 

    after_initialize :ensure_session_token
    attr_reader :password 

    def self.generate_session_token 
        SecureRandom::urlsafe_base64(16)
    end

    def self.find_by_credentials(email, password)
        debugger
        @user = User.find_by(email: email)
        if @user && is_password?(password) 
            @user
        else 
            flash[:error] = ['Not valid user credentials']
            redirect_to new_session_url
        end
    end

    def ensure_session_token 
        self.session_token ||= User.generate_session_token
    end

    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        # self.session_token 
    end

    def password=(password)
        @password = password 
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password) 
        BCrypt::Password.new(password).is_password?(self.password_digest)
    end

end
