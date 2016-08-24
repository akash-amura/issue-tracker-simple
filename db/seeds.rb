# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#


def generate_users(user_count=20)
  user_classes = [Developer,SysAdmin,Manager]
  user_count.times do 
    name = Faker::Name.name
    email = Faker::Internet.email
    password = password_confirmation = Faker::Internet.password(6,20)
    user = user_classes[Random.new.rand(3)].new(name:name,email:email,password:password,password_confirmation:password_confirmation)
    user.save
  end
end

def generate_projects(project_count=10)
  developers = Developer.all
  managers = Manager.all
  project_count.times do
    title = Faker::App.name
    description = Faker::Hacker.say_something_smart
    creation_date = Faker::Time.backward(30,:evening)
    planned_completion_date = Faker::Date.backward(30)
    actual_completion_date_values = [Faker::Date.forward(30),nil]
    actual_completion_date = actual_completion_date_values[Random.new.rand(actual_completion_date_values.length)]
    project = Project.new(title:title,description:description,creation_date:creation_date,planned_completion_date:planned_completion_date,actual_completion_date:actual_completion_date,manager_id:managers[Random.new.rand(Manager.count)].id,creator_id:developers[Random.new.rand(Developer.count)].id)
    project.save
  end
end

def generate_tickets(ticket_count=20)
  users = User.all
  ticket_count.times do
    title = Faker::Hacker.adjective
    description = Faker::Hacker.say_something_smart
    submission_date = Faker::Time.backward(30,:evening)
    planned_completion_date = Faker::Date.forward(30)
    actual_completion_date_values = [Faker::Date.forward(60),nil]
    actual_completion_date = actual_completion_date_values[Random.new.rand(actual_completion_date_values.length)]
    priority = Ticket.priorities.keys[Random.new.rand(Ticket.priorities.length)]
    category = Ticket.categories.keys[Random.new.rand(Ticket.categories.length)]
    state =  actual_completion_date.nil? ? Ticket.states.keys[Random.new.rand(Ticket.states.length)]:Ticket.states[:closed]
    user = users[Random.new.rand(User.count)].id
    blog_url = Faker::Internet.url
    ticket = Ticket.new(title:title,description:description,submission_date:submission_date,planned_completion_date:planned_completion_date,priority:priority,category:category,state:state,owner_id:user,blog_url:blog_url,actual_completion_date:actual_completion_date)
    ticket.save
  end
end

def generate_artifacts(artifact_count=20)
  tickets = Ticket.all
  artifact_count.times do
    title = Faker::Hacker.adjective
    description = Faker::Hacker.say_something_smart
    version = Faker::App.version
    data = []
    Random.new.rand(5).times do
      data << Faker::Internet.url
    end
    category = Artifact.categories.keys[Random.new.rand(Artifact.categories.length)]
    ticket = tickets[Random.new.rand(Ticket.count)].id
    size = Random.new.rand(1000)
    artifact = Artifact.new(title:title,description:description,version:version,data:data,category:category,ticket_id:ticket,size:size)
    artifact.save
  end
end

def generate_comments(comment_count=50)
  tickets = Ticket.all
  users = User.all

  comment_count.times do
    text = Faker::Hacker.say_something_smart
    date = Faker::Time.backward(30,:morning)
    ticket = tickets[Random.new.rand(Ticket.count)].id
    user = users[Random.new.rand(User.count)].id

    comment = Comment.new(text:text,date:date,ticket_id:ticket,user_id:user)
    comment.save
  end
end

def generate_tickets_projects(tickets_per_project=5,projects_per_ticket=5)
  projects = Project.all
  tickets = Ticket.all

  projects.each do |p| 
    Random.new.rand(tickets_per_project).times do 
      p.tickets << tickets[Random.new.rand(Ticket.count)]
    end
  end

  tickets.each do |t|
    Random.new.rand(projects_per_ticket).times do
      t.projects << projects[Random.new.rand(Project.count)]
    end
  end
end


def generate_developers_projects(projects_per_developer=5,developers_per_project=5)
  developers = Developer.all
  projects  = Project.all

  developers.each do |d|
    Random.new.rand(projects_per_developer).times do 
      d.projects << projects[Random.new.rand(Project.count)] 
    end
  end

  projects.each do |p|
    Random.new.rand(developers_per_project).times do
      p.developers << developers[Random.new.rand(Developer.count)]
    end
  end
end

def generate_project_logs(dev_logs=5)
  projects = Project.all
  projects.each do |p|
    devs = p.developers
    Random.new.rand(dev_logs).times do 
      devs.each do |d|
        date = Faker::Date.backward(30)
        hours = Random.new.rand(10)
        proj = p.id
        dev = d.id 
        log = ProjectLog.new(date:date,hours:hours,project_id:proj,user_id:dev)
        log.save
      end
    end
  end
end

def get_developer_for_ticket(ticket)
    devs = []
    ticket.projects.each do |p|
      devs +=  p.developers
    end
    devs
end

def generate_ticket_logs(dev_logs=5)
  tickets = Ticket.all
  tickets.each do |t|
    Random.new.rand(dev_logs).times do 
      get_developer_for_ticket(t).each do |d|
        date = Faker::Date.backward(30)
        hours = Random.new.rand(10)
        ticket = t.id
        dev = d.id
        log = TicketLog.new(date:date,hours:hours,ticket_id:ticket,developer_id:dev)
        log.save
      end
    end
  end
end

generate_users
generate_projects
generate_tickets
generate_artifacts
generate_comments
generate_tickets_projects
generate_developers_projects
generate_ticket_logs
generate_project_logs


