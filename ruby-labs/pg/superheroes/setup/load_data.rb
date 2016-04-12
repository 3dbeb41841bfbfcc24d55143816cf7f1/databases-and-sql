require 'pg'

db_conn = PG.connect(dbname: 'superheroes', host: 'localhost')

filename = ARGV[0]
puts "Loading file #{filename}"
File.new(filename, 'a+').map do |line|
  entry = line.split(',')
  name  = entry[0]
  alter_ego = entry[1]
  has_cape = entry[2] == 'true' ? true : false
  power = entry[3]
  arch_nem = entry[4].chomp
  sql_string = 'INSERT INTO superheroes ' \
  '(name, alter_ego, has_cape, power, arch_nemesis) ' \
  "VALUES ('#{name}', '#{alter_ego}', '#{has_cape}', " \
          "'#{power}', '#{arch_nem}');"
  db_conn.exec(sql_string)
end
