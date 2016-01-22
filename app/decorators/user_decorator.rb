class UserDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def edit_profile_link
    if object == current_user
      link_to 'Edit your profile', edit_user_registration_path
    end
  end

  def follow_link
    if current_user.is_following?(object)
      link_to 'Unfollow this user', unfollow_path(user: object), method: :delete
    else
      link_to 'Follow this user', follow_path(user: object), method: :post
    end
  end

  def display_number(type)
    # I know there's a better way than an elsif (or a case), I just don't know what that is.
    if type == "following"
      "I am following #{pluralize(object.number_followed_by_user, 'person')}."
    elsif type == "followers"
      "I have #{pluralize(object.number_of_followers, 'follower')}."
    else
      "Invalid query"
    end
  end
end
