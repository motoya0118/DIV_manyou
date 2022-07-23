module Admin::UsersHelper
  def edit_update
    if action_name == 'new' || action_name == 'create'
      admin_users_path
    else
      admin_user_path
    end
  end
end
