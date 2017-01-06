require 'spec_helper'

class DayTests < Test::Unit::TestCase
  def test_create_day_using_simple_constructor
    day = Day.new("Monday 2016-05-01")

    assert_equal("Monday 2016-05-01", day.name)
  end

  def test_day_has_date
    date = "2016-05-01"
    day = Day.new("Monday" + " " + date)

    assert_equal(Date.parse(date), day.date)
  end

  def test_day_without_date_throws_exception
    assert_raise NoDateException do
      day = Day.new("Monday")
    end
  end

  def test_day_has_tasks_equal_to_actions
    day = Day.new("Monday 2016-05-12")
    day.add_action("- First action")
    day.add_action("- delayed, - Second action")

    daily_status_extractor = DailyStatusExtractor.new(day)
    daily_status_extractor.proceed_day

    dailyTasks = daily_status_extractor.daily_tasks
    day.add_tasks(dailyTasks)

    assert_equal(day.actions.length, day.tasks.length)
  end

  def test_date_cant_be_parsed_throws_exception_with_meaningfull_information
    assert_raise IncorrectDateForDayException do
      day = Day.new("Monday 2017-01-44")
    end
  end
end
