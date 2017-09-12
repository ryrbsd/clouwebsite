class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :title
      t.string :text
      t.boolean :authorized
      t.timestamps null: false
    end
  end
end
