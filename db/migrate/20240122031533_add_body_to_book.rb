class AddBodyToBook < ActiveRecord::Migration[6.1]
   def change
     add_column :books, :body, :string
    add_column :books, :title, :string
end
end
