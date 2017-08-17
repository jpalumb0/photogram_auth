class Connection < ApplicationRecord
    belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
    
    belongs_to :added, :class_name => "User", :foreign_key => "added_id"
    
    validates :owner, :presence => true, :uniqueness => { :scope => :added }
    validates :added, :presence => true

end
