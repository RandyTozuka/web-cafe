class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :category
      t.text :content

      t.timestamps
    end
  end
end
