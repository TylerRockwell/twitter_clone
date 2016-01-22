class RenameFavoriteHandlersToFavorites < ActiveRecord::Migration
  def change
    rename_table :favorite_handlers, :favorites
  end
end
