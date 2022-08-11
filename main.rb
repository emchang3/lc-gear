require 'json'

require_relative './parsers/piece'

class Handler
  attr_accessor :gear_list

  def initialize
    @gear_list = []
  end

  def include(list_json_location)
    @gear_list += JSON.parse(`cat #{list_json_location}`).map do |pc|
      Piece.new(pc)
    end
  end

  def to_json
    @gear_list.map { |g| g.to_json }
  end
end

handler = Handler.new
handler.include('./data/green-gear.json')
handler.include('./data/blue-gear.json')
handler.include('./data/purple-gear.json')
handler.include('./data/gold-gear.json')

puts handler.to_json
