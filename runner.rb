require 'erb'
require './lib/reunion'
require './lib/activity'

reunion = Reunion.new("Hawaii")
activity = Activity.new("Hiking")
activity.add_participant({"Nikhil" => 30})
activity.add_participant({"Ian" => 30})
activity.add_participant({"Sergio" => 60})
reunion.add_activity(activity)

erb_file = 'page.html.erb'
html_file = File.basename(erb_file, '.erb') #=>"page.html"

erb_str = File.read(erb_file)

@reunion_location = "Reunion Location: #{reunion.location}"
@activity_name = "Reunion Activity: #{reunion.activities[0].name}"
@total_cost = "Reunion Total Cost: #{reunion.total_cost}"
@participant_1_name = "Participant 1 name: #{reunion.activities[0].participants[0].keys[0]}"
@participant_1_paid = "Participant 1 paid: #{reunion.activities[0].participants[0].values[0]}"
@participant_2_name = "Participant 2 name: #{reunion.activities[0].participants[1].keys[0]}"
@participant_2_paid = "Participant 2 paid: #{reunion.activities[0].participants[1].values[0]}"
@participant_3_name = "Participant 3 name: #{reunion.activities[0].participants[2].keys[0]}"
@participant_3_paid = "Participant 3 paid: #{reunion.activities[0].participants[2].values[0]}"

renderer = ERB.new(erb_str)
result = renderer.result()

File.open(html_file, 'w') do |f|
  f.write(result)
end
