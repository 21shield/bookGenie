class User < ActiveRecord::Base
    has_many: :reading_lists

end