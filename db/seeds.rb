# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#


require 'date'

dev1 = Developer.new(name:"bruce wayne",email:"bruce.w@example.com",password:"12345")
dev1.save

manager1 = Manager.new(name:"barry allen",email:"barry.a@example.com",password:"12345")
manager1.save

sysadmin1 = SysAdmin.new(name:"diana price",email:"diana.p@example.com",password:"12345")
sysadmin1.save

project1 = Project.new(title:"CMS",description:"A content manament system for bulding websites",planned_completion_date:Date.new(2016,1,1),actual_completion_date:DateTime.new(2016,2,1,4,5,6,'+7'),creation_date:Time.new(2015, 12, 20, 2, 2, 2, "+02:00").getutc,manager_id:2,creator_id:1)
project1.save

ticket1 = Ticket.new(title:"Page not rendered",description:"Page is not being rendered correctly",planned_completion_date:Date.new(2016,2,1),submission_date:Time.new(2016,2,1,4,5,"+5:30"),blog_url:"www.blogspot.com/12345",priority: :low,state: :open, category: :task,owner_id:1)
ticket1.save

artifact1 = Artifact.new(title:"Class Diagram for page",description:"A class diagram representing all the clases in the application",version:"1.0.1",data:["www.exampleurl.com"],category: :task,ticket_id:1)
artifact1.save


comment1 = Comment.new(text:"Good solution",date:Time.new(2016,2,1,6,7,"+5:30"),ticket_id:1,user_id:1)
comment1.save

proj = Project.find(1)
ticket = Ticket.find(1)
proj.ticket  << ticket

dev = Developer.find(1)
proj.developer << dev

