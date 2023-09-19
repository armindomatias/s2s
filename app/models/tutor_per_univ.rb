class TutorPerUniv < ApplicationRecord
  belongs_to :tutor
  belongs_to :university
end
