class CreateTables < ActiveRecord::Migration
  def change

    create_table(:employees) do |e|
      e.column(:name, :string)
      e.column(:division_id, :integer)
    end

    create_table(:divisions) do |d|
      d.column(:name, :string)
    end

  end
end
