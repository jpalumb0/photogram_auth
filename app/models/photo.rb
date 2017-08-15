class Photo < ApplicationRecord
    belongs_to :user # :required => false (optional if you don't want to make a foreign key required)
    has_many :comments
    has_many :likes
    
    has_many :fans, :through => :likes, :source => :user
    
    validates :user, :presence => true
end
