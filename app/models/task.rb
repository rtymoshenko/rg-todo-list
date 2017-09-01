class Task < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 200 }
  belongs_to :project
  validates :deadline, date: true,  date: { allow_blank: true }

end
