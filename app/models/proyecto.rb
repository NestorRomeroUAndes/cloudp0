class Proyecto < ApplicationRecord
  belongs_to :user
  has_many :design
end
