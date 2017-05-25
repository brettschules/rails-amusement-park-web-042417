class User < ActiveRecord::Base
  has_many :attractions, through: :rides
  has_many :rides

  has_secure_password

  validates :name, :height, :nausea, :happiness, :tickets, presence: true

  def mood
     nausea > happiness ? "sad" : "happy"
  end
end
