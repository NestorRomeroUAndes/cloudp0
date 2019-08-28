class DesignersController < ApplicationController
  def index
    @designs = designs.all
  end

  def new
    @design = design.new
  end
end
