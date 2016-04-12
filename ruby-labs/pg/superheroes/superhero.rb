# rubocop:disable Metrics/MethodLength

# Our SuperHero Class
class SuperHero
  attr_reader :id, :name, :alter_ego, :has_cape, :power, :arch_nemesis

  def initialize(args)
    @id           = args[0]
    @name         = args[1]
    @alter_ego    = args[2]
    @has_cape     = args[3]
    @power        = args[4]
    @arch_nemesis = args[5]
  end

  def self.from_array(array)
    array.values.map do |hero|
      SuperHero.new(hero)
    end
  end

  def self.pad(str, width)
    str.center(width, ' ')
  end

  def self.pretty_print(array)
    puts ' '  + pad('id',         3) + '| ' + pad('name',         16) +
         '| ' + pad('alter_ego', 15) + '| ' + pad('has_cape',      9) +
         '| ' + pad('power',     14) + '| ' + pad('arch_nemesis', 14)
    puts '---------------------------------------------------------' \
      '------------------------'

    array.each do |hero|
      puts ' '  + pad(hero.id, 3) +
           '| ' + pad(hero.name, 16) +
           '| ' + pad(hero.alter_ego, 15) +
           '| ' + pad(hero.has_cape, 9) +
           '| ' + pad(hero.power, 14) +
           '| ' + pad(hero.arch_nemesis, 14)
    end
  end

  def to_s
    msg  = 'Name: '         + @name         + "\n"
    msg += 'Alter Ego: '    + @alter_ego    + "\n"
    msg += 'Has cape? '     + @has_cape     + "\n"
    msg += 'Superpower: '   + @power        + "\n"
    msg += 'Arch Nemesis: ' + @arch_nemesis + "\n"
    msg
  end
end
