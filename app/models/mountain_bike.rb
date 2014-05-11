class MountainBike

  extend Forwardable
  def_delegators :@bike_type, :off_road_ability, :price

  TIRE_WIDTH_FACTOR = 1.freeze
  FRONT_SUSPENSION_FACTOR = 2.freeze
  REAR_SUSPENSION_FACTOR = 3.freeze

  def initialize(bike_type)
    @bike_type = bike_type
  end

  def add_front_suspension(params)
    @bike_type = FrontSuspensionMountainBike.new(
                                             @bike_type.upgrade_parameters.merge(params)
                                             )
  end

  def add_rear_suspension(params)
    unless @bike_type.is_a?(FrontSuspensionMountainBike)
      raise "You can't add rear suspension unless you have front suspension"
    end
    @bike_type = FullSuspensionMountainBike.new(
                                            @bike_type.upgrade_parameters.merge(params)
                                            )
  end

end
