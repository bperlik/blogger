module Whodat
    class User < Whodat::ApplicationRecord
        has_many :posts
    end
end