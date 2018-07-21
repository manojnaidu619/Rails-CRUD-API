class ClientsController < ApplicationController
  def index
    @clients = User.all
  end
end
