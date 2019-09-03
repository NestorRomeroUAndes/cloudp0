class User < ApplicationRecord

  has_many :evento
  include Clearance::User
  attr_accessor :empresa
end
