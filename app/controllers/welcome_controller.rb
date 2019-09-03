class WelcomeController < ApplicationController
  def index

  end
  def vanity
    @empresa = "-"
    if !params[:usrid].blank?
      @user = User.where(id: params[:usrid])
      @proyectos = @user.proyecto
    end
  end
end
