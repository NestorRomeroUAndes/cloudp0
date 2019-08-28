class DesignersController < ApplicationController
  def index
    @designers = Design.all
  end

  def new
    @designer = Design.new
  end

  def create
    @designer = Design.new(designers_params)

    if @designer.save
      redirect_to designers_path, notice: "Diseño cargado exitosamente"
    else
      render 'new'
    end
  end
end
