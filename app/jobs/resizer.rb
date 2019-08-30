class Resizer
  @queue = :resizer

  def self.perform()
    #recorrer base de datos y convertir lo que este pendiente.
    @pendingDesigns = Design.where(Estado: "pendiente")
    @pendingDesigns.each do |pd|
      pd.Estado = "Disponible"
      pd.media.is_live = true
      pd.save
      img.media.recreate_versions! :cover
    end
  end
end
