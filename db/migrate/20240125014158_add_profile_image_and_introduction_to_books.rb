class AddProfileImageAndIntroductionToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :profile_image, :string
    add_column :books, :introduction, :text
  end
end
