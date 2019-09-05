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
    #@designer = Design.new(designers_params)
    #el estado debe ser pendiente
    #@designer.Estado = "pendiente"
    if @proyecto.design.create(designers_params)
      redirect_to welcome_path(@proyecto), notice: "Hemos recibido tu diseño y lo estamos procesado para que sea publicado. Tan pronto esto ocurra, te notificaremos por email."
    else
      render 'new'
    end
  end

  private
  def designers_params
    params.require(:design).permit(:Nombres, :Apellidos, :Email, :Precio,:Estado, :Imagen)
  end
end
