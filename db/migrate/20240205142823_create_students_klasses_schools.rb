class CreateStudentsKlassesSchools < ActiveRecord::Migration[6.1]
  def change
    create_table :magic_schools do |t|
      t.string :name

      t.timestamps
    end

    create_table :klasses do |t|
      t.string :number
      t.string :letter
      t.integer :students_count

      t.references :magic_school, null: false

      t.timestamps
    end

    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :surname

      t.references :klass, null: false
      t.references :magic_school, null: false

      t.timestamps
    end
  end
end