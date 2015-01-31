class User < ActiveRecord::Base
  # Remember to create a migration!

   def self.authenticate(validate = {})
     account =  User.find_by_email(validate[:email])

     if account.nil? == false && account.password == validate[:password]
       return account
     else
      return nil
     end

   end

  has_many :rounds
  has_many :gues, through: :rounds
end