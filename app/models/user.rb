class User < ActiveRecord::Base
  has_many :attractions, through: :rides
  has_many :rides

  has_secure_password

  def mood
     nausea > happiness ? "sad" : "happy"
  end
end
