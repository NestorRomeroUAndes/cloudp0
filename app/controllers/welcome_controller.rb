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
end
