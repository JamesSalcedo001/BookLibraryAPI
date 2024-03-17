class AddPublishedToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :published, :boolean
  end
end
