class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :deadline, :project_id, :position, :status
  has_many   :comments
end
