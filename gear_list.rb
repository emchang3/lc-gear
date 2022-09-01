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
