class ProyectosController < ApplicationController
  before_action :require_login

  def index
    @proyectos = current_user.proyectos.order(id: :desc)
  end

  def show
    @proyecto = current_user.proyectos.find(params[:id])
  end

  def edit
    @proyecto = current_user.proyectos.find(params[:id])
  end

  def new
     @proyecto = current_user.proyectos.build
  end

  def create
    @proyecto = current_user.proyectos.build(evento_params)
    if @proyecto.save
      redirect_to @proyecto
    else
      render 'new'
    end
  end

  def update
    @proyecto = current_user.proyectos.find(params[:id])

    if @proyecto.update(evento_params)
      redirect_to @proyecto
    else
      render 'edit'
    end
  end

  def destroy
    @proyecto = current_user.proyectos.find(params[:id])
    @proyecto.destroy

    redirect_to proyectos_path
  end

  private
  def proyectos_params
    params.require(:proyecto).permit(:nombre, :descripcion, :valor)
  end
end
