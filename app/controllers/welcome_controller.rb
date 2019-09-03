class WelcomeController < ApplicationController
  def index

  end
  def vanity
    @empresa = "-"
    if !params[:empresa].blank?
      @empresa = params[:empresa]

    end
  end
end
