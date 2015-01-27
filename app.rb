require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("pg")
require("pry")
require("./lib/employee")
require("./lib/division")
require("./lib/project")
require("./lib/contribution")

get("/") do
  erb(:index)
end

post("/employees") do
  name = params.fetch("name")
  division_id = params["division_id"].to_i() || nil
  employee = Employee.create({ :name => name, :division_id => division_id })
  redirect("/")
end

patch("/employees") do
  employee_id = params.fetch("employee_id").to_i()
  division_id = params.fetch("division_id").to_i()
  employee = Employee.find(employee_id)
  employee.update({ :division_id => division_id })
  redirect("/divisions")
end

get("/divisions") do
  erb(:divisions)
end

get("/divisions/:id") do
  @division_id = params.fetch('id').to_i()
  erb(:division)
end

post("/divisions") do
  name = params.fetch("name")
  division = Division.create({ :name => name })
  redirect("/divisions")
end

get("/employees/:id") do
  @employee_id = params.fetch('id').to_i()
  erb(:employee)
end

post("/projects") do
  employee_id = params.fetch("employee_id").to_i()
  employee = Employee.find(employee_id)
  project_id = params["project_id"].to_i()
  new_project_name = params["new_project"]

  if project_id != nil && project_id != "" && project_id != 0
    project = Project.find(project_id)
  else
    project = Project.create({ :name => new_project_name, :done => false })
  end

  # project_ids = employee.project_ids()
  # project_ids.push(project.id())
  # employee.update(:project_ids => project_ids)

  employee.projects << project

  url = "/employees/" + employee_id.to_s()
  redirect(url)
end

get("/projects") do
  erb(:projects)
end

patch("/projects") do
  project_id = params.fetch('project_id').to_i()
  project = Project.find(project_id)
  project.update({ :done => true })
  redirect("/projects")
end

get("/projects/:id") do
  @project_id = params.fetch("id").to_i()
  erb(:project)
end
