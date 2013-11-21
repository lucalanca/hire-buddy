class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.string :state
      t.integer :candidate_id
      t.integer :interviewer_id
      t.integer :position_id

      

      t.index :candidate_id
      t.index :interviewer_id
      t.index :position_id

      t.timestamps
    end
  end
end
