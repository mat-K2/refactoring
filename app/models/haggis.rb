class Haggis
  def initialize(primary_force, secondary_force, mass, delay)
    @primary_force, @secondary_force, @mass, @delay = primary_force, secondary_force, mass, delay
  end

  def distance_traveled(time)
    accelerate_secondary?(time) ? primary_distance_traveled(time) + secondary_distance_traveled(time) : primary_distance_traveled(time)
  end

  def accelerate_secondary?(time)
    secondary_time(time) > 0
  end

  def primary_distance_traveled(time)
    0.5 * primary_acc * primary_time(time) * primary_time(time)
  end

  def secondary_distance_traveled(time)
    primary_vel * secondary_time(time) + 5 * secondary_acc * secondary_time(time) * secondary_time(time)
  end

  def primary_acc
    @primary_force / @mass
  end

  def secondary_acc
    (@primary_force + @secondary_force) / @mass
  end

  def primary_time(time)
    [time, @delay].min
  end

  def secondary_time(time)
    time - @delay
  end

  def primary_vel
    primary_acc * @delay
  end
end
