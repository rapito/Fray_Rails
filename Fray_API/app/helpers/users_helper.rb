module UsersHelper
  def user_get_name user
    user.first_name + ' ' + user.first_last_name
  end
end
