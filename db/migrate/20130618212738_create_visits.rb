class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :ip
      t.string :browser_agent

      t.timestamps
    end
  end
end
