puts "There are #{Message.count} messages and #{User.count} users in our database."

x = Reply.delete_all(["body LIKE ?", "%fuck%"])
puts "#{x} replies contains \"fuck\" got deleted."