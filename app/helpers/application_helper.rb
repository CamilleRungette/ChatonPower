module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def cart_count
    cart_items_count = User.find(current_user.id).cart.items.count 
    return cart_items_count
  end

end
