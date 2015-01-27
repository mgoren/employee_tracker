class AddContributions < ActiveRecord::Migration
  def change
    create_table(:contributions) do |j|
      j.column(:employee_id, :integer)
      j.column(:project_id, :integer)
    end
  end
end
