class WelcomeController < ApplicationController
  def index

  end
  def vanity
    @empresa = "-"
    if !params[:usrid].blank?
      @empresa = User.where(id: params[:usrid]).empresa
      @proyectos = User.where(id: params[:usrid]).proyecto
    end
  end
end
