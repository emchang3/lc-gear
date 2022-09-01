require 'json'

require_relative './gear_list'

config = JSON.parse(`cat config.json`)

list = GearList.new

sources = config['sources']

sources.each { |s| list.include(s) }

desired_gear = config['lists']

threads = []

desired_gear.each do |l|
  threads << Thread.new {
    gears =
      l['criteria']
        .map { |m| list.gear_list.select { |g| g.send(m) } }
        .select { |gl| gl.length.positive? }
    
    gear = gears[0] if gears.length.positive?
    gears.each { |g| gear = g & gear }
    
    gearl = GearList.new(gear)
    gearl.write_file(l['filename'])
  }
end

threads.each(&:join)
