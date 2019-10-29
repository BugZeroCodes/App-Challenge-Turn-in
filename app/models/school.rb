class School < ApplicationRecord
  validates :name, presence: true,
   uniqueness: true,
    length: {maximum: 1000, too_long: "I don't wanna be that guy, but that's way too long for a school name."}
  belongs_to :student
end
