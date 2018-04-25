class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
			t.string :name
			t.string :hometown
			t.string :last_lab
			t.string :current_track
			t.integer :learn
			t.string :slack
			t.string :github
			t.string :avatar

      t.timestamps
    end
  end
end
