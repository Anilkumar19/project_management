class Project < ActiveRecord::Base
	#associations
	belongs_to :user
	has_many :card_lists, dependent: :destroy
	#validations
	validates :title, :user_id, presence: true
end
