class AddProjects < ActiveRecord::Migration
  def change
    create_table(:projects) do |p|
      p.column(:name, :string)
      p.column(:employee_id, :integer)
    end
  end
end
