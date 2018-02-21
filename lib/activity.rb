class Activity

  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = []
  end

  def add_participant(participant)
    participants << participant
  end

  def total_cost
    participants.reduce(0) do | total, participant |
      total + participant.values[0]
    end
  end

  def split_cost
    (total_cost / participants.length.to_f).round(1)
  end

  def amount_owed
    participants.map do | participant |
      name = participant.keys[0]
      amount_owed = split_cost - participant.values[0]
      { name => amount_owed }
    end
  end

end
