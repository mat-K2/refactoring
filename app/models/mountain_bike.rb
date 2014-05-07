class MountainBike

  TIRE_WIDTH_FACTOR = 1.freeze
  FRONT_SUSPENSION_FACTOR = 2.freeze
  REAR_SUSPENSION_FACTOR = 3.freeze

  def initialize(params)
    @tire_width = params[:tire_width]
    @commission = params[:commission]
    @base_price = params[:base_price]
    @front_fork_travel = params[:front_fork_travel]
    @rear_fork_travel = params[:rear_fork_travel]
    @front_suspension_price = params[:front_suspension_price]
    @rear_suspension_price = params[:rear_suspension_price]
  end

  def type_code=(mod)
    extend(mod)
  end

  def off_road_ability
    @tire_width * TIRE_WIDTH_FACTOR
  end

  def price
    (1 + @commission) * @base_price
  end
end
