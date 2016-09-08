class CreateSentences < ActiveRecord::Migration[5.0]
  def change
    create_table :sentences do |t|
      t.column :author, :string
      t.column :story_id, :integer
      t.column :text, :string
      t.column :image_url, :string
      t.timestamps
    end
  end
end
