class CreateCommentVotings < ActiveRecord::Migration
  def change
    create_table :comment_votings do |t|
      t.integer :direction
      t.references :user
      t.references :comment

      t.timestamps
    end
    add_index :comment_votings, :user_id
    add_index :comment_votings, :comment_id
  end
end
