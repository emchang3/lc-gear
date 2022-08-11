

class Materials
  attr_reader :adamantium_frame, :ceramite_plates, :data_cables, :servo_motor

  def initialize(materials_json)
    @adamantium_frame = materials_json['adamantiumFrame']
    @ceramite_plates = materials_json['ceramitePlates']
    @data_cables = materials_json['dataCables']
    @servo_motor = materials_json['servoMotor']
  end
end
