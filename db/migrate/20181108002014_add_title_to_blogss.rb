class AddTitleToBlogss < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :title, :string
  end
end
