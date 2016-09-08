class DropImageUrlColumnFromStory < ActiveRecord::Migration[5.0]
  def change
    remove_column :stories, :image_url, :string
  end
end
