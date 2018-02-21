require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_if_it_exists
    activity = Activity.new("hiking")

    assert_instance_of Activity, activity
  end

  def test_if_it_can_take_a_name
    activity = Activity.new("hiking")

    assert_equal "hiking", activity.name
  end

  def test_if_it_has_an_initial_empty_participants_array
    activity = Activity.new("hiking")

    assert_equal [], activity.participants
  end

  def test_if_it_can_add_participants
    activity = Activity.new("hiking")
    activity.add_participant({"Nikhil" => 32})

    assert_equal [{"Nikhil" => 32}], activity.participants
  end

  # def test_if_it_can_add_two_participants
  #   activity = Activity.new("hiking")
  #   activity.add_participant({"Nikhil" => 32})
  #   activity.add_participant({"Adrian" => 20})
  #
  #   assert_equal [{"Nikhil" => 32}, {"Adrian" => 20}], activity.participants
  # end


end
