# USERS
email = ['admin@test.com', 'mechanic@test.com', 'customer@test.com']
# TASKS
tasks = [
  'Open Work Order',
  'Hidden Damage Inspection',
  'Clean Aircraft',
  'Remove Necessary Cowlings',
  'Perform requested inspections',
  'Perform Ground Runs',
  'Complete Log Book Entry'
  ]
task_descriptions = [
  'Complete necessary paperwork and billing information. Ensure all customer requests are addressed',
  'Review past logbooks and generally inspect aircraft for signs of hidden damage',
  'Clean exterior of aircraft',
  'Remove, clean insides, and inspect all cowlings and fairins required to complete inspections.',
  'Perform all inspections requested by customer (This would actually be many inspections, but for simplicity is one',
  'Complete any ground runs and leak checks necessary due to maintenance performed. (This could have a sub-task outlining details)',
  'Generate a log book entry, and complete any paperwork that is required for return to service.'
]
# WORK ORDERS
customer = [
  'HeliQwest',
  'AirMed',
  'Upper Limit'
]
description = [
  '600 hour airframe and engine inspection',
  '100 hour airframe inspection',
  '50 hour engine oil change'
]
tail_number = [
  'N401HQ',
  'N410UH',
  'N351CH'
]
list_title = [
  'To Do',
  'In Progress',
  'Complete'
]
list_description = [
  'Tasks to be completed',
  'Tasks currently in progress',
  'Tasks completed'
]
x = 0

3.times do |i| 
  WorkOrder.create(
    customer: customer[i],
    description: description[i],
    tail_number: tail_number[i],
    serial_number: rand(12345),
    date_opened: Faker::Date.backward(4),
    date_needed: Faker::Date.forward(14)
    )
      3.times do |i| 
        List.create(
          work_order_id: WorkOrder.last.id,
          title: list_title[i],
          description: list_description[i]
        )
      end
    end
    
tasks.length.times do |i| 
  Task.create(
    task_title: tasks[i],
    task_description: task_descriptions[i],
    list_id: List.first.id,
    priority: rand(1..5)
  )
end
tasks.length.times do |i| 
  Task.create(
    task_title: tasks[i],
    task_description: task_descriptions[i],
    list_id: List.last.id,
    priority: rand(1..5)
  )
end

  
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    admin: true,
  email: email[0],
  password: 'password',
  password_confirmation: 'password'
  )
  
User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  mechanic: true,
  email: email[1],
  password: 'password',
  password_confirmation: 'password'
  )
    
User.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  customer: true,
  email: email[2],
  company_name: 'HeliQwest',
  password: 'password',
  password_confirmation: 'password'
  )
  puts "Created 'admin', 'mechanic' and 'customer' @test.com with password 'password'"

