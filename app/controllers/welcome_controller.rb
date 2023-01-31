class WelcomeController < ApplicationController
  def index
    @types = Type.actif
  end
end
