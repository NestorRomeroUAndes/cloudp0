class DesignsController < ApplicationController

  def index

    @designers = Design.all
    #Resque.enqueue(Resizer)
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
