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
      total + total_expenses_participant_one_activity(name, activity)
    end
  end

  def total_expenses_participant_one_activity(name, activity)
    activity.participants.each do |participant|
      @result = participant.values[0] if name == participant.keys[0]
    end
    @result
  end

  def split_cost
    (total_cost.to_f / activities.first.participants.length).round(1)
  end

  def amount_owed_each_participant
    activities.first.participants.map do |participant|
      name = participant.keys.first
      value = (split_cost.to_f -
      total_expenses_for_participant_for_all_activities(name)).round(1)
      {name => value}
    end
  end

end
