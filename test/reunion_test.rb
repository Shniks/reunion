require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test

  def test_if_it_exists
    reunion = Reunion.new("Hawaii")

    assert_instance_of Reunion, reunion
  end

  def test_reunion_has_a_location
    reunion = Reunion.new("Hawaii")

    assert_equal "Hawaii", reunion.location
  end

  def test_reunion_can_take_another_location
    reunion = Reunion.new("Palm Springs")

    assert_equal "Palm Springs", reunion.location
  end

  def test_reunion_has_an_empty_activities_array
    reunion = Reunion.new("Hawaii")

    assert_equal [], reunion.activities
  end

  def test_add_activities_can_add_activities
    reunion = Reunion.new("Hawaii")
    activity = Activity.new("Hiking")
    reunion.add_activity(activity)

    assert_equal [activity], reunion.activities
    assert_instance_of Activity, reunion.activities.first
  end

  def test_it_can_evaluate_total_reunion_cost
    reunion = Reunion.new("Hawaii")
    activity = Activity.new("Hiking")
    activity.add_participant({"Nikhil" => 30})
    activity.add_participant({"Ian" => 30})
    activity.add_participant({"Mike" => 43})
    reunion.add_activity(activity)

    assert_equal 103, reunion.total_cost
  end

  def test_it_can_evaluate_total_reunion_cost_to_one_decimal_place
    reunion = Reunion.new("Hawaii")
    activity = Activity.new("Hiking")
    activity.add_participant({"Nikhil" => 30.22})
    activity.add_participant({"Ian" => 30.2})
    activity.add_participant({"Mike" => 43.3})
    reunion.add_activity(activity)

    assert_equal 103.7, reunion.total_cost
  end

  def test_it_can_evaluate_total_reunion_cost_for_two_activities
    reunion = Reunion.new("Hawaii")
    activity = Activity.new("Hiking")
    activity.add_participant({"Nikhil" => 30})
    activity.add_participant({"Ian" => 30})
    reunion.add_activity(activity)

    activity = Activity.new("Swimming")
    activity.add_participant({"Nikhil" => 40.2})
    activity.add_participant({"Ian" => 45})
    activity.add_participant({"Sergio" => 75.3})
    reunion.add_activity(activity)

    assert_equal 220.5, reunion.total_cost
  end

  def test_it_can_evaluate_participant_expense_for_one_activity
    reunion = Reunion.new("Hawaii")
    activity_1 = Activity.new("Hiking")
    activity_1.add_participant({"Nikhil" => 30})
    activity_1.add_participant({"Ian" => 30})
    reunion.add_activity(activity_1)

    activity_2 = Activity.new("Swimming")
    activity_2.add_participant({"Nikhil" => 40})
    activity_2.add_participant({"Ian" => 45})
    activity_2.add_participant({"Sergio" => 75})
    reunion.add_activity(activity_2)

    result_1 = reunion.total_expenses_participant_one_activity("Nikhil",
    activity_1)

    assert_equal 30, result_1

    result_2 = reunion.total_expenses_participant_one_activity("Nikhil",
    activity_2)

    assert_equal 40, result_2
  end

  def test_it_can_evaluate_total_expenses_for_a_participant_for_all_activities
    reunion = Reunion.new("Hawaii")
    activity = Activity.new("Hiking")
    activity.add_participant({"Nikhil" => 30})
    activity.add_participant({"Ian" => 30})
    reunion.add_activity(activity)

    activity = Activity.new("Swimming")
    activity.add_participant({"Nikhil" => 40})
    activity.add_participant({"Ian" => 45})
    activity.add_participant({"Sergio" => 75})
    reunion.add_activity(activity)

    result = reunion.total_expenses_for_participant_for_all_activities("Nikhil")

    assert_equal 70, result
  end

  def test_it_can_split_expenses
    reunion = Reunion.new("Hawaii")
    activity = Activity.new("Hiking")
    activity.add_participant({"Nikhil" => 30})
    activity.add_participant({"Adrian" => 30})
    activity.add_participant({"Sergio" => 60})
    reunion.add_activity(activity)

    activity = Activity.new("Swimming")
    activity.add_participant({"Nikhil" => 40})
    activity.add_participant({"Adrian" => 45})
    activity.add_participant({"Sergio" => 75})
    reunion.add_activity(activity)

    assert_equal 93.3, reunion.split_cost
  end

  def test_it_can_compute_amount_owed
    skip
    reunion = Reunion.new("Hawaii")
    activity = Activity.new("Hiking")
    activity.add_participant({"Nikhil" => 30})
    activity.add_participant({"Adrian" => 30})
    activity.add_participant({"Sergio" => 60})
    reunion.add_activity(activity)

    activity = Activity.new("Swimming")
    activity.add_participant({"Nikhil" => 40})
    activity.add_participant({"Adrian" => 45})
    activity.add_participant({"Sergio" => 75})
    reunion.add_activity(activity)

    assert_equal [{"Nikhil" => 23.3}, {"Adrian" => 18.3}, {"Sergio" => -41.7}],
    reunion.amount_owed_each_participant
  end

end
