class Action < ApplicationRecord
  belongs_to :contact
  belongs_to :company
  belongs_to :job
end