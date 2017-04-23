class Post < ActiveRecord::Base
    has_many: comments, #relationship with comment model
    validates :title, presence:true,
    length:{minimum:5} 
end
