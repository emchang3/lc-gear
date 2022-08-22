require 'json'

require_relative './parsers/piece'

class GearList
  attr_accessor :gear_list

  def initialize(initial_list = nil)
    @gear_list = !initial_list.nil? ? initial_list : []
  end

  def include(list_json_location)
    @gear_list += JSON.parse(`cat #{list_json_location}`).map do |pc|
      Piece.new(pc)
    end
  end

  def write_file(filename)
    f = File.open("./output/#{filename}.json", 'w')
    f.write(self.to_json)
    f.close
  end

  def to_json
    JSON.pretty_generate(@gear_list.map { |g| g.json })
  end
end

list = GearList.new
list.include('./data/green-gear.json')
list.include('./data/blue-gear.json')
list.include('./data/purple-gear.json')
list.include('./data/gold-gear.json')

desired_gear = [
  {
    filename: 'epic-vanguard-gear',
    criteria: [
      'is_epic',
      'buffs_vanguard'
    ]
  },
  {
    filename: 'elite-vanguard-gear',
    criteria: [
      'is_elite',
      'buffs_vanguard'
    ]
  },
  {
    filename: 'epic-dreadnought-gear',
    criteria: [
      'is_epic',
      'buffs_dreadnought'
    ]
  },
  {
    filename: 'elite-dreadnought-gear',
    criteria: [
      'is_elite',
      'buffs_dreadnought'
    ]
  },
  {
    filename: 'epic-primaris-gear',
    criteria: [
      'is_epic',
      'buffs_primaris'
    ]
  },
  {
    filename: 'elite-primaris-gear',
    criteria: [
      'is_elite',
      'buffs_primaris'
    ]
  },
  {
    filename: 'epic-prim-vv-gear',
    criteria: [
      'is_epic',
      'buffs_primaris',
      'buffs_vanguard'
    ]
  },
  {
    filename: 'epic-vv-dread-gear',
    criteria: [
      'is_epic',
      'buffs_vanguard',
      'buffs_dreadnought'
    ]
  }
]

threads = []

desired_gear.each do |l|
  threads << Thread.new {
    gears =
      l[:criteria]
      .map { |m| list.gear_list.select { |g| g.send(m) } }
      .select { |gl| gl.length.positive? }
    
    gear = gears[0] if gears.length.positive?
    gears.each { |g| gear = g & gear }
    
    gearl = GearList.new(gear)
    gearl.write_file(l[:filename])
  }
end

threads.each(&:join)
