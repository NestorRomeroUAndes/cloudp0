class DesignersController < ApplicationController
  def index
    @designs = Design.all
  end

  def new
    @design = Design.new
  end

  def create
    @design = Design.new(design_params)

    if @design.save
      redirect_to designers_path, notice: "Diseño cargado exitosamente"
    else
      render 'new'
    end
  end
end
