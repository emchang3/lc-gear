require_relative './unit'

class Stats
  def initialize(stats_json)
    @dreadnought = !stats_json['dreadnought'].nil? ? Unit.new(stats_json['dreadnought']) : nil
    @predator = !stats_json['predator'].nil? ? Unit.new(stats_json['predator']) : nil
    @primaris_squad = !stats_json['primarisSquad'].nil? ? Unit.new(stats_json['primarisSquad']) : nil
    @vanguard_veteran = !stats_json['vanguardVeteran'].nil? ? Unit.new(stats_json['vanguardVeteran']) : nil
    @whirlwind = !stats_json['whirlwind'].nil? ? Unit.new(stats_json['whirlwind']) : nil
    @adamantium_collecting_speed = stats_json['adamantiumCollecting_speed']
    @army_size_limit = stats_json['armySizeLimit']
    @crystal_collecting_speed = stats_json['crystalCollecting_speed']
    @fuel_collecting_speed = stats_json['fuelCollecting_speed']
    @harvesting_speed = stats_json['harvesting_speed']
    @metal_collecting_speed = stats_json['metalCollecting_speed']
    @non_player_damage = stats_json['nonPlayerDamage']
    @non_player_damage_taken = stats_json['nonPlayerDamageTaken']
    @plasma_collecting_speed = stats_json['plasmaCollecting_speed']
  end
end
