class WelcomeController < ApplicationController
  def index

  end
  def vanity
    @empresa = "-"
    if !params[:usrid].blank?
      # @proyectos = User.find(params[:usrid]).proyecto
      @proyectos = User.find(params[:usrid]).proyecto.joins(:design).order('id DESC').paginate(:page => params[:page], :per_page => 10)
      #@proyectos = @designs.group_by(&:nombre)
      @empresa = User.find(params[:usrid]).empresa
    end
    Resque.enqueue(Resizer)
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
