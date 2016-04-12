require 'pg'

def pad(str, width)
  str.center(width, ' ')
end

# Make a connection to the superheroes DB
conn = PG.connect(dbname: 'superheroes')

# Execute a SELECT from the superheroes table
# and print out the results
conn.exec('SELECT * FROM superheroes ORDER BY name') do |result|
  puts ' '  + pad('id', 3) +
    '| ' + pad('name', 16) +
    '| ' + pad('alter_ego', 15) +
    '| ' + pad('has_cape', 9) +
    '| ' + pad('power', 14) +
    '| ' + pad('arch_nemesis', 14)
  puts '---------------------------------------------------------' \
    '------------------------'

  result.each do |row|
    # puts row
    puts ' '  + pad(row['id'], 3) +
      '| ' + pad(row['name'], 16) +
      '| ' + pad(row['alter_ego'], 15) +
      '| ' + pad(row['has_cape'], 9) +
      '| ' + pad(row['power'], 14) +
      '| ' + pad(row['arch_nemesis'], 14)
  end
end
