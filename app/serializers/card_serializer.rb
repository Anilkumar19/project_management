class CardSerializer < ActiveModel::Serializer
  attributes :id, :task_name, :card_list_id, :card_list_name

  def card_list_name
  	object.card_list.try(:title)
  end
end
