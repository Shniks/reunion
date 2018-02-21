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

  def test_if_it_can_add_two_participants
    activity = Activity.new("hiking")
    activity.add_participant({"Nikhil" => 32})
    activity.add_participant({"Ian" => 20})

    assert_equal [{"Nikhil" => 32}, {"Ian" => 20}], activity.participants
  end

  def test_if_it_can_evaluate_total_cost_of_an_activity
    activity = Activity.new("hiking")
    activity.add_participant({"Nikhil" => 32})
    activity.add_participant({"Ian" => 20})
    activity.add_participant({"Mike" => 65})

    assert_equal 117, activity.total_cost
  end

  def test_it_can_split_the_cost_of_an_activity
    activity = Activity.new("hiking")
    activity.add_participant({"Nikhil" => 33})
    activity.add_participant({"Ian" => 20})

    assert_equal 26.5, activity.split_cost
  end

  def test_it_can_split_the_cost_of_another_activity
    activity = Activity.new("hiking")
    activity.add_participant({"Nikhil" => 30})
    activity.add_participant({"Ian" => 30})
    activity.add_participant({"Mike" => 40})

    assert_equal 33.3, activity.split_cost
  end

  def test_it_can_find_amount_owed_by_each_person
    activity = Activity.new("hiking")
    activity.add_participant({"Nikhil" => 30})
    activity.add_participant({"Ian" => 43})

    assert_equal [{"Nikhil" => 6.5}, {"Ian" => -6.5}], activity.amount_owed
  end

  def test_it_can_find_amount_owed_by_four_people
    activity = Activity.new("hiking")
    activity.add_participant({"Nikhil" => 30})
    activity.add_participant({"Ian" => 43})
    activity.add_participant({"Mike" => 25})
    activity.add_participant({"Sergio" => 66})

    assert_equal [{"Nikhil"=>11.0}, {"Ian"=>-2.0}, {"Mike"=>16.0},
    {"Sergio"=>-25.0}], activity.amount_owed
  end

end
