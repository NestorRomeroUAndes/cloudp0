class User < ApplicationRecord

  has_many :evento
  include Clearance::User
  validates :empresa, presence: true
end
