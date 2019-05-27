class ItemsController < ApplicationController
  def index
  end

  def show
  	@item = Item.all
  end

end
