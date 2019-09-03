class WelcomeController < ApplicationController
  def index

  end
  def vanity
    @empresa = "-"
    if !params[:empresa].blank?
      @empresa = params[:empresa]
      @proyectos = user.where(id: usrid).proyecto
    end
  end
end
