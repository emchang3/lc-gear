require_relative './set'
require_relative './stats'
require_relative './materials'

class Piece
  attr_reader :json, :name, :type, :quality, :stats, :set, :materials

  def initialize(piece_json)
    @id = piece_json['id']
    @name = piece_json['name']
    @type = piece_json['type']
    @quality = piece_json['quality']
    @stats = Stats.new(piece_json['stats'])
    @set = !piece_json['set'].nil? ? Set.new(piece_json['set']) : nil
    @materials = Materials.new(piece_json['materials'])
    @json = piece_json

    unless @set.nil?
      @json['set'] = @set.json
    end
  end

  def is_legendary
    self.quality == 'legendary'
  end

  def is_epic
    self.quality == 'epic'
  end

  def is_elite
    self.quality == 'elite'
  end

  def is_outstanding
    self.quality == 'outstanding'
  end

  def buffs_vanguard
    !self.stats.vanguard_veteran.nil?
  end

  def buffs_dreadnought
    !self.stats.dreadnought.nil?
  end

  def buffs_primaris
    !self.stats.primaris_squad.nil?
  end

  def buffs_predator
    !self.stats.predator.nil?
  end

  def buffs_whirlwind
    !self.stats.whirlwind.nil?
  end
end
