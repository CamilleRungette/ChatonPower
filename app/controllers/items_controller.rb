class ItemsController < ApplicationController
  def index
  	@item = Item.all
  end
end
