class CreateStudentAuths < ActiveRecord::Migration[6.1]
  def change
    create_table :student_auths do |t|
      t.references :student, null: false, foreign_key: true
      t.string :auth_token

      t.timestamps
    end
  end
end
