

class Materials
  def initialize(materials_json)
    @ceramite_plates = materials_json['ceramitePlates']
    @adamantium_frame = materials_json['adamantiumFrame']
    @data_cables = materials_json['dataCables']
    @servo_motor = materials_json['servoMotor']
  end
end
