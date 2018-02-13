class CardList < ActiveRecord::Base
	#associations
	belongs_to :project
	has_many :cards, dependent: :destroy
	#validations
	validates :title, :project_id, presence: true
end
