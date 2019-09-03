class User < ApplicationRecord

  has_many :evento
  has_many :proyecto
  include Clearance::User
  validates :empresa, presence: true
end
