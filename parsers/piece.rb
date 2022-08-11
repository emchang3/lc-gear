require_relative './set'
require_relative './stats'
require_relative './materials'

class Piece
  def initialize(piece_json)
    @json = piece_json
    @name = piece_json['name']
    @type = piece_json['type']
    @quality = piece_json['quality']
    @stats = Stats.new(piece_json['stats'])
    @set = !piece_json['set'].nil? ? Set.new(piece_json['set']) : nil
    @materials = Materials.new(piece_json['materials'])
  end

  def to_json
    JSON.generate(@json)
  end
end
