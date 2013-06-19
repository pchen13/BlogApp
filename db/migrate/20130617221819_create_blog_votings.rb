class CreateBlogVotings < ActiveRecord::Migration
  def change
    create_table :blog_votings do |t|
      t.integer :direction
      t.references :user
      t.references :blog

    end
    add_index :blog_votings, :user_id
    add_index :blog_votings, :blog_id
  end
end
