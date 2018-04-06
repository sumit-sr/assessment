module Admin::UsersHelper

  def faculty_list
    User.faculties.map{|user| [user.full_name, user.profile.id] }
  end

  def user_role
    [['Student','student'], ['Faculty','faculty']]
  end
end
