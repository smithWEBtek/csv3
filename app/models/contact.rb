class Contact < ApplicationRecord
  belongs_to :company
  has_many :actions
end