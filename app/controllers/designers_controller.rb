class DesignersController < ApplicationController
  def index
    @designs = design.all
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
