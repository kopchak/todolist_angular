class Task < ActiveRecord::Base
  belongs_to :project
  has_many   :comments, dependent: :destroy
  validates  :title, :deadline, presence: true
end
