class WelcomeController < ApplicationController
  def index

  end
  def vanity
    @empresa = "-"
    if !params[:usrid].blank?
      @proyectos = User.where(id: params[:usrid]).proyecto
    end
  end
end
