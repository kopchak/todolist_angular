# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
3.times { |i| p = Project.create(title: "title#{i}")
  3.times { |j| t = Task.create(title: "title#{j}", deadline: Time.now, project_id: p.id)
    3.times { |y| Comment.create(text: "title#{y}", task_id: t.id) }
  }
}
