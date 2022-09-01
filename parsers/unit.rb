class Unit
  attr_reader :attack, :defense, :hp

  def initialize(unit_json)
    @attack = unit_json['attack']
    @defense = unit_json['defense']
    @hp = unit_json['hp']
  end
end
