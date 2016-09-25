class MenusController < ApplicationController
  def index
    @menus = Menu.all.order(created_at :desc)
  end
end
