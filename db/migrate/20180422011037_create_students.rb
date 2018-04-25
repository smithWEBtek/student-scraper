class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
			t.integer :github_id
			t.string :login
			t.string :url
			t.string :avatar_url
			t.string :name
			t.string :blog
			t.string :location
			t.string :bio
			t.string :email
			t.string :learn
      t.timestamps
    end
  end
end
