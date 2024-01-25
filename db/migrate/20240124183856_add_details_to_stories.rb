class AddDetailsToStories < ActiveRecord::Migration[7.1]
  def change
    add_column :stories, :number_of_characters, :integer
    add_column :stories, :character_names, :text
    add_column :stories, :average_age, :integer
    add_column :stories, :setting, :string
    add_column :stories, :theme, :string
    add_column :stories, :custom_setting, :string
    add_column :stories, :custom_theme, :string
  end
end
