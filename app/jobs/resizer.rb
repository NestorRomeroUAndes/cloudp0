class Resizer
  @queue = :resizer

  def self.perform()
    #recorrer base de datos y convertir lo que este pendiente.
    @pendingDesigns = Design.where(Estado: "pendiente")
    @pendingDesigns.each do |pd|
      pd.Estado = "Disponible"
      pd.Imagen.is_live = true
      pd.save
      pd.Imagen.recreate_versions!(:cover)
    end
  end
end
