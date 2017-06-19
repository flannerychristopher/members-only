class User < ApplicationRecord
  attr_accessor :remember_token
  has_secure_password
  before_create :create_remember_digest
  #create token with SecureRandom.urlsafe_base64 and .to_s
  #encrypt token with Digest::SHA1.hexdigest
  #save



  #create a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(string)
    #Digest::SHA1.hexdigest 'string'
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)

  end

  #remember token in database for persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end



  private

    def create_remember_digest
      self.remember_token = User.new_token
      self.remember_digest = User.digest(remember_token)
      #update_attribute(:remember_digest, self.remember_digest)
    end

end
