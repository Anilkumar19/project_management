class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :user_name
  has_many :card_lists


  def user_name
  	object.user.try(:name)
  end
end
