class CardListSerializer < ActiveModel::Serializer
  attributes :id, :title, :project_id, :project_name
  has_many :cards

  def project_name
  	object.project.try(:title)
  end
end
