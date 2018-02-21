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

end
