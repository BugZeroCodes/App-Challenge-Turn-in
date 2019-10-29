class AddStudentIdToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :student_id, :integer
  end
end
