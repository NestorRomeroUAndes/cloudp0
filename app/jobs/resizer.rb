class Resizer
  @queue = :resizer

  def self.perform()
    #recorrer base de datos y convertir lo que este pendiente.
    @pendingDesigns = Design.where(Estado: "pendiente")
    #@pendingDesigns = Design.all
    @pendingDesigns.each do |pd|
      if pd.Imagen.blank?
        next
      end
      pd.Estado = "Disponible"
      img = pd.Imagen.cover.file.file
      mrk = pd.Nombres + " " + pd.Apellidos + " " + pd.created_at.to_s
      rimg = ::Magick::Image.read(img).first
      cover = rimg.resize(800, 600)
      mark = Magick::Image.new(cover.columns, cover.rows) {self.background_color = "none"}
      draw = Magick::Draw.new
      draw.annotate(mark, 0, 0, 0, 0, mrk) do
        # place the text in the centre of the canvas
        draw.gravity = Magick::SouthGravity
        # set text height in points where 1 point is 1/72 inches
        draw.pointsize = 20
        draw.font_family = "Times" # set font
        draw.fill = "black" # set text color
        draw.stroke = "none" # remove stroke
      end
      cover = cover.watermark(mark, 0.5, 0.5, Magick::CenterGravity)
      cover.write(img.chomp(File.extname(img)) + '.png')
      pd.save
    end
  end
end
