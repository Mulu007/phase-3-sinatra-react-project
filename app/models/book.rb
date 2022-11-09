class Book < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews
	belongs_to :genre
    
    validates :title, presence: true
    validates :description, presence: true


	def self.search(search)
		if search
			genre = Genre.find_by(title: search)

		else
			Book.all
		end
	end
  

    def average_rating
        reviews = BookReview.where(["book_id = ?", id])
        count = 0.0
        reviews.each { |x| 
        count += x.rating.to_f }
        puts "Average Rating across #{reviews.size} reviews: " + "#{(count/reviews.size).round(2)}"
      end
end