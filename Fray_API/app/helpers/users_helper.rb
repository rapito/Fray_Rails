module UsersHelper

  def get_user_name user
    user.first_name + ' ' + user.first_last_name
  end

  def user_get_name user
    get_user_name user
  end


end
