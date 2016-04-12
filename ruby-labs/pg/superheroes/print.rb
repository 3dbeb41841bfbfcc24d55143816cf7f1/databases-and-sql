require 'pg'

# Make a connection to the superheroes DB
conn = PG.connect(dbname: 'superheroes')

# Execute a SELECT from the superheroes table
# and print out the results
conn.exec('SELECT * FROM superheroes') do |result|
  result.each do |row|
    # puts row
    puts "#{row['id']} : #{row['name']}"
    puts "  Alter Ego: #{row['alter_ego']}"
    puts "  Has Cape: #{row['has_cape']}"
    puts "  Power: #{row['power']}"
    puts "  Arch Nemesis: #{row['arch_nemesis']}"
    puts
  end
end
