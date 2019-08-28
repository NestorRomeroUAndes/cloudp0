class DesignersController < ApplicationController
  def index
    @designs = designers.all
  end

  def new
    @design = designers.new
  end

  def create
    @design = designers.new(designers_params)

    if @design.save
      redirect_to designers_path, notice: "Diseño cargado exitosamente"
    else
      render 'new'
    end
  end
end
