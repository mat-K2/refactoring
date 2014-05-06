module MountainBike

  TIRE_WIDTH_FACTOR = 1.freeze
  FRONT_SUSPENSION_FACTOR = 2.freeze
  REAR_SUSPENSION_FACTOR = 3.freeze

  def initialize(params)
    params.each { |key, value| instance_variable_set("@#{key}", value) }
  end
end
