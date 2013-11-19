class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title
      t.integer :difficulty
      t.string :category

      t.timestamps
    end
  end
end
