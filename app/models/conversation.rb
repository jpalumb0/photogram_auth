class Conversation < ApplicationRecord
    has_many :messages
    has_many :users, :through => :messages, :source => :user
    
    
end
