class DesignersController < ApplicationController
  def index
    @designs = designs.all
  end

  def show
    @design = designs.find(params[:id])
  end

  def new
    @design = design.new
  end

  def create
    @design = design.new(design_params)

    if @design.save
      redirect_to designers_path, notice: "Diseño cargado exitosamente"
    else
      render 'new'
    end
  end
end
