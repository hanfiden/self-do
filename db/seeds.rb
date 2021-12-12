puts "Clearing meetings database"
Meeting.destroy_all

puts "Generated Meetings"
Meeting.create(name: 'test1', start_time: DateTime.now(), end_time: '2021-12-24', user_id: 1)
puts "1 Meeting"
Meeting.create(name: 'test2', start_time: '2021-12-14', end_time: '2021-12-17', user_id: 1)
puts "1 Meeting"
Meeting.create(name: 'test3', start_time: '2021-12-11', end_time: '2021-12-18', user_id: 1)
puts "1 Meeting"
Meeting.create(name: 'test4', start_time: '2021-12-07', end_time: '2021-12-11', user_id: 1)
puts "1 Meeting"
