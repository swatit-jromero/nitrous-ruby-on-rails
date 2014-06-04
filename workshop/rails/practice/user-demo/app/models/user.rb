class User < ActiveRecord::Base
    
    validates_presence_of :name, message: "Enter name"
    
end
