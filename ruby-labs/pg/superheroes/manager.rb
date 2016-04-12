# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity

require 'pg'
require_relative './superhero'

# SuperHeroManager manages a DB of SuperHeroes
class SuperHeroManager
  def initialize
    @db_conn = PG.connect(dbname: 'superheroes', host: 'localhost')
  end

  def run
    while process_command(ask_user); end
  end

  private

  def ask_user
    puts
    puts 'Would you like to:'
    puts '(I) See an index of all superheroes'
    puts '(C) Create a superhero,'
    puts '(R) Read a the values of a particular superhero,'
    puts '(U) Update a superhero,'
    puts '(D) Destroy a superhero,'
    puts '(Q) Quit'
    gets.chomp.capitalize
  end

  def process_command(command)
    keep_going = true
    case command
    when 'I' then do_index
    when 'C' then do_create
    when 'R' then do_read
    when 'U' then do_update
    when 'D' then do_delete
    when 'Q' then keep_going = false
    else
      puts 'That is not a valid command'
    end
    keep_going
  end

  def get_answer_to(question)
    puts question
    gets.chomp
  end

  def do_index
    result_set = @db_conn.exec('SELECT * FROM superheroes;')
    puts 'Here they are: '
    # puts SuperHero.from_array(result_set).join("\n")
    SuperHero.pretty_print(SuperHero.from_array(result_set))
  end

  def do_create
    name         = get_answer_to('Great, what is their name?')
    alter        = get_answer_to('What is their alter ego?')
    cape         = get_answer_to('True of False: do they have a cape?')
    superpower   = get_answer_to('What is their superpower?')
    arch_nemesis = get_answer_to('Who is their arch nemesis?')

    sql_string = 'INSERT INTO superheroes ' \
                 '(name, alter_ego, has_cape, power, arch_nemesis) ' \
                 "VALUES ('#{name}', '#{alter}', '#{cape}', " \
                 "'#{superpower}', '#{arch_nemesis}');"
    @db_conn.exec(sql_string)
    puts "#{name} is now logged in the superhero database"
  end

  def do_read
    input_name = get_answer_to('Enter name of superhero you want to view')
    result_set = @db_conn.exec('SELECT * FROM superheroes ' \
                               "WHERE name='#{input_name}'")
    puts "\n" + SuperHero.from_array(result_set).join("\n")
  end

  def do_update
    target        = get_answer_to('Interesting. Who do you want to update?')
    new_attribute = get_answer_to('What attribute do you want to update?')
    new_value     = get_answer_to('Cool. What value do you want to assign?')
    @db_conn.exec('UPDATE superheroes ' \
                  "SET #{new_attribute} = '#{new_value}' " \
                  "WHERE name='#{target}'"
                 )
    puts "Great. #{target}'s #{new_attribute} value is now #{new_value}."
  end

  def do_delete
    target = get_answer_to('Oh no! Which superhero do you want to destroy?')
    @db_conn.exec("DELETE FROM superheroes WHERE name='#{target}'")
    puts "#{target} is dead."
  end
end
