class Set
  attr_reader :two_piece, :three_piece, :five_piece, :json

  def initialize(set_id)
    sets = JSON.parse(`cat parsers/sets.json`)

    set_json = sets[set_id]

    @two_piece = set_json['2pc']
    @three_piece = set_json['3pc']
    @five_piece = set_json['5pc']
    @json = set_json
  end
end
