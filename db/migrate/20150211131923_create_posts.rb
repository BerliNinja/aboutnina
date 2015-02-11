class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.timestamp :updated_at
      t.timestamp :created_at
    end
  end
end
