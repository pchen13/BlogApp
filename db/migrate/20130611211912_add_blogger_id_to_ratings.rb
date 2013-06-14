class AddBloggerIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :blogger_id, :integer
  end
end
