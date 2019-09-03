class Design < ApplicationRecord
  mount_uploader :Imagen, ImageUploader # Tells rails to use this uploader for this model.
  validates :Nombres, presence: true # Make sure the owner's name is present.
  belongs_to :proyecto
end
