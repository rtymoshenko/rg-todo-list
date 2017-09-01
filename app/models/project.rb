class Project < ActiveRecord::Base

  validates :name, presence: true, length: { maximum: 100 }
  has_many :tasks
  belongs_to :user
end
