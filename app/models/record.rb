class Record < ApplicationRecord
	has_many :answers
	belongs_to :user
    belongs_to :note
end
