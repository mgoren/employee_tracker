require('spec_helper')

describe(Employee) do
  it("returns division employee belongs to") do
    div1 = Division.create({:name => "Accounting"})
    emp1 = Employee.create({:name => "Dan", :division_id => div1.id()})
    expect(emp1.division()).to(eq(div1))
  end
end
