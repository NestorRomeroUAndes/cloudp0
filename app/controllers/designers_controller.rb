class DesignersController < ApplicationController
  def index
    @designers = Design.all
    #Resque.enqueue(Resizer)

    @pendingDesigns = Design.all
    @pendingDesigns.each do |pd|
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
      cover.write(img)
      pd.save
    end
  end

  def new
    @designer = Design.new
  end

  def create
    @designer = Design.new(designers_params)
    #el estado debe ser pendiente
    @designer.Estado = "pendiente"

    if @designer.save
      redirect_to designers_index_path, notice: "Diseño cargado exitosamente"
    else
      render 'new'
    end
  end

  private
  def designers_params
    params.require(:design).permit(:Nombres, :Apellidos, :Email, :Precio,:Estado, :Imagen)
  end
end
