class Design < ApplicationRecord
  mount_uploader :Imagen, ImageUploader # Tells rails to use this uploader for this model.
  validates :Nombres, presence: true # Make sure the owner's name is present.
  belongs_to :proyecto
  before_save :default_values
  def default_values
    self.Estado ||= 'pendiente' 
  end
end
