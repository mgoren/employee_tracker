class AddManyToMany < ActiveRecord::Migration
  def change

    create_table(:employees_projects) do |j|
      j.column(:employee_id, :integer)
      j.column(:project_id, :integer)
    end

    remove_column(:projects, :employee_id)



  end
end
