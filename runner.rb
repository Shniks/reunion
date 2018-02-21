require 'erb'
require './lib/reunion'
require './lib/activity'

reunion = Reunion.new("Hawaii")
activity = Activity.new("Hiking")
activity.add_participant({"Nikhil" => 30})
activity.add_participant({"Ian" => 30})
activity.add_participant({"Sergio" => 60})
reunion.add_activity(activity)

# require 'pry'; binding.pry

erb_file = 'page.html.erb'
html_file = File.basename(erb_file, '.erb') #=>"page.html"

erb_str = File.read(erb_file)

@reunion_location = "Reunion Location: #{reunion.location}"
@activity_name = "Reunion Activity: #{reunion.activities[0].name}"

renderer = ERB.new(erb_str)
result = renderer.result()

File.open(html_file, 'w') do |f|
  f.write(result)
end
