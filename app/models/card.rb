class Card < ActiveRecord::Base
	#associations
	belongs_to :card_list

	#validations
	validates :task_name, :card_list_id, presence: true
end
