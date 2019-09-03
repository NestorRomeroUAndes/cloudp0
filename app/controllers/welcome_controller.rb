class WelcomeController < ApplicationController
  def index

  end
  def vanity
    @empresa = "-"
    if !params[:usrid].blank?
      @empresa = user.where(id: params[:usrid]).empresa
      @proyectos = user.where(id: params[:usrid]).proyecto
    end
  end
end
