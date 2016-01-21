class PostDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all
  decorates :post

  def favorite_icon
    if object.user_favorites.include?(current_user)
      link_to '', unfavorite_post_path(post), method: :delete, class: "glyphicon glyphicon-heart"
    else
      link_to '', favorite_post_path(post), method: :post, class: "glyphicon glyphicon-heart-empty"
    end
  end

  def edit_icon
    if post.user == current_user
      link_to '', edit_post_path(post), class: "glyphicon glyphicon-pencil"
    end
  end

  def favorites_list
    list = ""
    if object.user_favorites.empty?
      list << "Nobody yet."
    else
      object.user_favorites.each do |favorite|
        list << favorite.username + "<br />"
      end
    end
    list
  end
end
