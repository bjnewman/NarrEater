class MenusController < ApplicationController
  def index
    @menus = Menu.order(created_at: :desc)
  end
end
