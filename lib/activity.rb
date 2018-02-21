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
    participants.reduce(0) do |total, participant|
      total + participant.values[0]
    end
  end 

end
