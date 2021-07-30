class Task < ApplicationRecord
  validates :task_name, presence: true
  validates :content, presence: true
  #validates :enddate, presence: true
  validates :status, presence: true
  validates :priority, presence: true
  enum priority: [:low, :medium, :high]
  scope :task_name_fuzzy_search, ->(params) { where('task_name LIKE ?', "%#{params}%") }
    scope :status_search, ->(params) { where(status: params) }
  paginates_per 10

end
