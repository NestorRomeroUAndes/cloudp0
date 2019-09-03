class DesignsController < ApplicationController

  def index

    @designers = Design.all
    #Resque.enqueue(Resizer)
  end

  def new
    @designer = Design.new
  end

  def create
    @proyecto = Proyecto.find(params[:proyecto_id])
    @designer = Design.new(designs_params)
    #el estado debe ser pendiente
    @designer.Estado = "pendiente"
    @design = @proyecto.design.create(@designer)
        #
    # if @designer.save
    #   redirect_to welcome_index_path, notice: "Diseño cargado exitosamente"
    # else
    #   render 'new'
    # end
  end

  private
  def designers_params
    params.require(:design).permit(:Nombres, :Apellidos, :Email, :Precio,:Estado, :Imagen)
  end
end
