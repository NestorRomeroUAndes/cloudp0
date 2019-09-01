class Resizer
  @queue = :resizer

  def self.perform()
    #recorrer base de datos y convertir lo que este pendiente.
    @pendingDesigns = Design.where(Estado: "pendiente")
    @pendingDesigns.each do |pd|
      pd.Estado = "Disponible"
      pd.save
    end
  end
end
