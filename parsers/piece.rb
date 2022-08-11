require_relative './set'
require_relative './stats'
require_relative './materials'

class Piece
  attr_reader :json, :name, :type, :quality, :stats, :set, :materials

  def initialize(piece_json)
    @json = piece_json
    @name = piece_json['name']
    @type = piece_json['type']
    @quality = piece_json['quality']
    @stats = Stats.new(piece_json['stats'])
    @set = !piece_json['set'].nil? ? Set.new(piece_json['set']) : nil
    @materials = Materials.new(piece_json['materials'])
  end

  def buffs_vanguard
    !self.stats.vanguard_veteran.nil?
  end

  def buffs_dreadnought
    !self.stats.dreadnought.nil?
  end
end
