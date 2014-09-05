class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.text :comment
      t.references :user
      t.timestamps    
    end
  end
end
