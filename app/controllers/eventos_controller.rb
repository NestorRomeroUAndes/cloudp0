class EventosController < ApplicationController
  def index
    @eventos = Evento.all
  end
  def show
    @evento = Evento.find(params[:id])
  end

  def edit
    @evento = Evento.find(params[:id])
  end

  def new
     @evento = Evento.new
  end

  def create
    @evento = Evento.new(evento_params)
    if @evento.save
      redirect_to @evento
    else
      render 'new'
  end

  def update
    @evento = Evento.find(params[:id])

    if @evento.update(evento_params)
      redirect_to @evento
    else
      render 'edit'
    end
  end

  def destroy
    @evento = Evento.find(params[:id])
    @evento.destroy

    redirect_to eventos_path
  end

  private
  def evento_params
    params.require(:evento).permit(:nombre, :categoria, :lugar, :direccion, :fecha_inicio, :fecha_fin, :modalidad)
  end
end
