class Note < ApplicationRecord
    has_many :note_tags, dependent: :destroy
    has_many :tags, :through => :note_tags

    accepts_nested_attributes_for :note_tags, allow_destroy: true
end
