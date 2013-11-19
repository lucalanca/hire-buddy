class CreateInterviewers < ActiveRecord::Migration
  def change
    create_table :interviewers do |t|
      t.string :name
      t.string :position 
      t.string :photo

      t.timestamps
    end
  end
end
