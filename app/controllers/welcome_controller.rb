class WelcomeController < ApplicationController
  def index

  end
  def vanity
    @empresa = "-"
    if !params[:status].blank?
      @empresa = params[:status]
    end
  end
end
