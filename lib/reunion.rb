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
    end.round(1)
  end

  def total_expenses_for_participant_for_all_activities(name)
    activities.reduce(0) do |total, activity|
      total + total_expenses_participant_one_activity(name, activity, total)
    end
  end

  def total_expenses_participant_one_activity(name, activity)
    activity.participants.each do |participant|
      @result = participant.values[0] if name == participant.keys[0]
    end
    @result
  end


end
