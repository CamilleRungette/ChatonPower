class ItemsController < ApplicationController
  def index
  	@item = Item.all
  end

  def show
  	@item = Item.all
  end

end
