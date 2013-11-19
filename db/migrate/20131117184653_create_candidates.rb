class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :current_position
      t.string :photo

      t.timestamps
    end
  end
end
