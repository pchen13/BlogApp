class CreateBlogVisits < ActiveRecord::Migration
  def change
    create_table :blog_visits do |t|
      t.references :user
      t.references :visit

      t.timestamps
    end
    add_index :blog_visits, :user_id
    add_index :blog_visits, :visit_id
  end
end
