class CreateTableMainPic < ActiveRecord::Migration
  def change
    create_table :table_main_pics do |t|
      t.string :picture_url
      t.boolean :authorized
      t.timestamps null: false
    end
  end
end
