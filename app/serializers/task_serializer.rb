class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_at
end
