class ProyectosController < ApplicationController
  before_action :require_login

  def index
    @proyectos = current_user.proyecto.order(id: :desc)
  end

  def show
    @proyecto = current_user.proyecto.find(params[:id])
  end

  def edit
    @proyecto = current_user.proyecto.find(params[:id])
  end

  def new
     @proyecto = current_user.proyecto.build
  end

  def create
    @proyecto = current_user.proyecto.build(evento_params)
    if @proyecto.save
      redirect_to @proyecto
    else
      render 'new'
    end
  end

  def update
    @proyecto = current_user.proyecto.find(params[:id])

    if @proyecto.update(evento_params)
      redirect_to @proyecto
    else
      render 'edit'
    end
  end

  def destroy
    @proyecto = current_user.proyecto.find(params[:id])
    @proyecto.destroy

    redirect_to proyectos_path
  end

  private
  def proyecto_params
    params.require(:proyecto).permit(:nombre, :descripcion, :valor)
  end
end
