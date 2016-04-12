require 'pg'

# Establish a DB connection via PG
class FamousConnection
  def initialize
    @conn = PG.connect(dbname: 'famous', host: 'localhost')
    @conn.prepare('insert_user',
                  'INSERT INTO people (first, last, dob, occupation) '\
                  'VALUES ($1, $2, $3, $4)')
  end

  def delete_all
    @conn.exec('delete from people')
  end

  def insert_person(first, last, dob, occupation)
    @conn.exec_prepared('insert_user', [first, last, dob, occupation])
  end

  def print_people
    @conn.exec('select * from people order by dob desc') do |result|
      result.each do |row|
        puts row
      end
    end
  end

  def close
    @conn.close
  end
end

begin
  connection = FamousConnection.new
  # connection.delete_all
  connection.insert_person('Richard', 'Feynman',  '1911-05-11', 'Physicist')
  connection.insert_person('Albert',  'Einstein', '1879-03-14', 'Physicist')
  connection.insert_person('Isaac',   'Newton',   '1643-03-14', 'Physicist')
  connection.print_people
rescue StandardError => e
  puts e.message
  puts e.backtrace.inspect
  raise e
ensure
  connection.close
end
