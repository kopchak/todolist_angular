class Project < ActiveRecord::Base
  belongs_to :user
  has_many   :tasks, dependent: :destroy

  validates  :title, presence: true
  default_scope { order("id ASC") }
end
