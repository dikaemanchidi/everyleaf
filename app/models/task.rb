class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  #validates :enddate, presence: true
  validates :status, presence: true
  validates :priority, presence: true
  enum priority: [:low, :medium, :high]
  scope :title_search, -> (query) {where("title LIKE ?", "%#{query}%")}
   def title_search(query)
     where("title LIKE ?", "%#{query}%")
   end
  scope :status_search, -> (query) {where(status: query)}
   def status_search(query)
       where(status: query)
    end
  paginates_per 10

end
