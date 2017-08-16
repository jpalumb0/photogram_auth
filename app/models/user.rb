class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :wallets#, :dependent => :destroy
  has_many :messages#, :dependent => :destroy
  
  has_many :conversations, :through => :messages, :source => :conversation

end
