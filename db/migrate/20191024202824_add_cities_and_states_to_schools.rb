class AddCitiesAndStatesToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :city, :string
    add_column :schools, :state, :string
  end
end
