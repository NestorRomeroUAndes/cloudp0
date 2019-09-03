class WelcomeController < ApplicationController
  def index

  end
  def vanity
    @empresa = "-"
    if !params[:usrid].blank?
      @proyectos = User.find(params[:usrid]).proyecto
      @empresa = User.find(params[:usrid]).empresa
      #@proyectos = @user.proyecto
    end
  end

  def show
    @proyecto = Proyecto.find(params[:id])
  end

  def new
     @proyecto = Proyecto.build
  end

  def create
    @proyecto = current_user.proyecto.build(proyecto_params)
    if @proyecto.save
      redirect_to @proyecto
    else
      render 'new'
    end
  end

end
