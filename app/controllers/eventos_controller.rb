class EventosController < ApplicationController
  before_action :require_login

  def index
    @eventos = current_user.evento
  end

  def show
    @evento = current_user.evento.find(params[:id])
  end

  def edit
    @evento = current_user.evento.find(params[:id])
  end

  def new
     @evento = current_user.evento.build
  end

  def create
    @evento = current_user.evento.build(evento_params)
    if @evento.save
      redirect_to @evento
    else
      render 'new'
    end
  end

  def update
    @evento = current_user.evento.find(params[:id])

    if @evento.update(evento_params)
      redirect_to @evento
    else
      render 'edit'
    end
  end

  def destroy
    @evento = current_user.evento.find(params[:id])
    @evento.destroy

    redirect_to eventos_path
  end

  private
  def evento_params
    params.require(:evento).permit(:nombre, :categoria, :lugar, :direccion, :fecha_inicio, :fecha_fin, :modalidad)
  end
end
