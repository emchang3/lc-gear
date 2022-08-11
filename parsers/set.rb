

class Set
  def initialize(set_json)
    @two_piece = set_json['2pc']
    @three_piece = set_json['3pc']
    @five_piece = set_json['5pc']
  end
end
