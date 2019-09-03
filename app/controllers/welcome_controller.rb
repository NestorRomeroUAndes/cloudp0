class WelcomeController < ApplicationController
  def index

  end
  def vanity
    @empresa = "-"
    if !params[:usrid].blank?
      @proyectos = User.where(id: params[:usrid]).first.proyecto
      #@proyectos = @user.proyecto
    end
  end
end
