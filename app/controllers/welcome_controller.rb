class WelcomeController < ApplicationController
  def index

  end
  def vanity
    @empresa = "-"
    if !params[:usrid].blank?
      @empresa = User.find(params[:empresa]).empresa
      @proyectos = User.find(params[:usrid]).proyecto
      #@proyectos = @user.proyecto
    end
  end
end
