class Conversation < ApplicationRecord
    has_many :messages
    has_many :members, :through => :messages, :source => :user
    
    has_one :connection
    
    #validates :members, :presence => true, :uniqueness => { :scope => :members }
end
