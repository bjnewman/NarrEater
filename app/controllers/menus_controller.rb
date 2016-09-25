class MenusController < ApplicationController
  def index
    @menus = Menu.order(created_at: :desc)
  end

  def create
    #api logic will go here
  end


end
