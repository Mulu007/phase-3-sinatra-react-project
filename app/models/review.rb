class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :book

    validates :content, length: { minimum: 2 }
end