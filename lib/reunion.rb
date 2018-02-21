class Reunion

  attr_reader :location,
              :activities

  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activity(activity)
    activities << activity
  end

  def total_cost
    activities.reduce(0) do |total, activity|
      total + activity.total_cost
    end
  end

end
