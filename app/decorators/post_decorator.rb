class PostDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all
  decorates :post

  def favorite_icon
    if object.users_who_favorited.include?(current_user)
      link_to '', favorite_path(post), method: :delete, class: "glyphicon glyphicon-heart"
    else
      link_to '', favorites_path(id: post.id), method: :post, class: "glyphicon glyphicon-heart-empty"
    end
  end

  def edit_icon
    if post.user == current_user
      link_to '', edit_post_path(post), class: "glyphicon glyphicon-pencil"
    end
  end

  def favorites_list
    list = ""
    if object.users_who_favorited.empty?
      list << "Nobody yet."
    else
      # I'm not sure how to make this work properly
      # html_safe will work, but that opens a XSS vulnerability
      object.users_who_favorited.each do |favorite|
        list << favorite.username + "<br />"
      end
    end
    list
  end
end
