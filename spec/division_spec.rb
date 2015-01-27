require('spec_helper')

describe(Division) do
  it("lists employees in division") do
    div1 = Division.create({:name => "Accounting"})
    emp1 = Employee.create({:name => "Dan", :division_id => div1.id()})
    emp2 = Employee.create({:name => "Mike", :division_id => div1.id()})
    expect(div1.employees()).to(eq([emp1, emp2]))
  end
end
