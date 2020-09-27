class Api::V2::TaskSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :description, :done, :deadline, :created_at, :updated_at,
             :short_description, :is_late

  def short_description
    object.description[0..40]
  end

  def is_late
    Time.current > object.deadline if object.deadline.present?
  end

end
