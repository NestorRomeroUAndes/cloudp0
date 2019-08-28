class Design < ApplicationRecord
  mount_uploader :Imagen, ImagenUploader # Tells rails to use this uploader for this model.
  validates :Nombres, presence: true # Make sure the owner's name is present.
end
