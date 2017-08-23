class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_one :wallet#, :dependent => :destroy
  has_many :messages#, :dependent => :destroy
  
  has_many :conversations, :through => :messages, :source => :conversation
  
  validates :username, :presence => true, :uniqueness => { :case_sensitive => false }
  
  # app/models/user.rb
  has_many :connection_where_owner, :class_name => "Connection", :foreign_key => "owner_id"
  
  has_many :connections_where_owner, :through => :connection_where_owner, :source => :added
  
  
  has_many :connection_where_added, :class_name => "Connection", :foreign_key => "added_id"
  
  has_many :connections_where_added, :through => :connection_where_added, :source => :owner

end
