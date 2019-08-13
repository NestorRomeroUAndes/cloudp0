class User < ApplicationRecord

  has_many :evento
  include Clearance::User
end
