class Product < ApplicationRecord
  validates :name, presence: true

	has_many :orders
    has_many :comments

 def self.search(search_term)
    if Rails.env.development?
          Product.where("name LIKE ?", "%#{search_term}%")
        else
          Product.where("name ilike ?", "%#{search_term}%")
        end
  end



  def views
    $redis.get("product:#{id}") # this is equivalent to 'GET product:1'
  end

def viewed!
    $redis.incby("product:#{id}") # this is equivalent to 'INC product:1'
  end


def highest_rating_comment
  comments.rating_desc.first
end
    
 def lowerest_rating_comment
    comments.rating_asc.first
  end
  def average_rating
   
    comments.average(:rating).to_f
  end



    
end
