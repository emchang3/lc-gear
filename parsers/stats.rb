require_relative './unit'

class Stats
  attr_reader :adamantium_collecting_speed, :army_size_limit, :crystal_collecting_speed, :dreadnought, :fuel_collecting_speed, :harvesting_speed, :metal_collecting_speed, :non_player_damage, :non_player_damage_taken, :plasma_collecting_speed, :predator, :primaris_squad, :vanguard_veteran, :whirlwind

  def initialize(stats_json)
    @adamantium_collecting_speed = stats_json['adamantiumCollecting_speed']
    @army_size_limit = stats_json['armySizeLimit']
    @crystal_collecting_speed = stats_json['crystalCollecting_speed']
    @dreadnought = !stats_json['dreadnought'].nil? ? Unit.new(stats_json['dreadnought']) : nil
    @fuel_collecting_speed = stats_json['fuelCollecting_speed']
    @harvesting_speed = stats_json['harvesting_speed']
    @metal_collecting_speed = stats_json['metalCollecting_speed']
    @non_player_damage = stats_json['nonPlayerDamage']
    @non_player_damage_taken = stats_json['nonPlayerDamageTaken']
    @plasma_collecting_speed = stats_json['plasmaCollecting_speed']
    @predator = !stats_json['predator'].nil? ? Unit.new(stats_json['predator']) : nil
    @primaris_squad = !stats_json['primarisSquad'].nil? ? Unit.new(stats_json['primarisSquad']) : nil
    @vanguard_veteran = !stats_json['vanguardVeteran'].nil? ? Unit.new(stats_json['vanguardVeteran']) : nil
    @whirlwind = !stats_json['whirlwind'].nil? ? Unit.new(stats_json['whirlwind']) : nil
  end
end
