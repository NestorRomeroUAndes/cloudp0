class User < ApplicationRecord

  has_many :evento
  include Clearance::User
  attr_accessible :empresa
end
