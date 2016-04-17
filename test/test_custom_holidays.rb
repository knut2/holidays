require File.expand_path(File.dirname(__FILE__)) + '/test_helper'

class CustomHolidaysTest < Test::Unit::TestCase

  def test_custom_region_present_after_single_file_parsing
    assert_raises Holidays::UnknownRegionError do
      Holidays.on(Date.civil(2013,6,20), :custom_single_file)
    end

    Holidays.load_custom('test/data/test_single_custom_holiday_defs.yaml')

    assert_not_equal [], Holidays.on(Date.civil(2013,6,20), :custom_single_file)
  end

  def test_custom_region_present_after_easter_file_parsing
    assert_raises Holidays::UnknownRegionError do
      Holidays.on(Date.civil(2013,6,20), :custom_easter_file)
    end
    Holidays.load_custom('test/data/test_single_custom_easter_defs.yaml')

    assert_equal [], Holidays.on(Date.civil(2016,3,26), :custom_easter_file)
    assert_equal ['Easter monday'], Holidays.on(Date.civil(2016,3,27), :custom_easter_file)
  end

  def test_custom_holidays_present_after_multiple_file_parsing
    assert_raises Holidays::UnknownRegionError do
      Holidays.on(Date.civil(2013, 10,5), :custom_multiple_files)
    end

    assert_raises Holidays::UnknownRegionError do
      Holidays.on(Date.civil(2013,3,1), :custom_multiple_files)
    end

    assert_raises Holidays::UnknownRegionError do
      Holidays.on(Date.civil(2013,3,1), :custom_multiple_files_govt)
    end

    Holidays.load_custom('test/data/test_multiple_custom_holiday_defs.yaml', 'test/data/test_custom_govt_holiday_defs.yaml')

    assert_not_equal [], Holidays.on(Date.civil(2013,10,5), :custom_multiple_files)
    assert_not_equal [], Holidays.on(Date.civil(2013,3,1), :custom_multiple_files)
    assert_not_equal [], Holidays.on(Date.civil(2013,3,1), :custom_multiple_files_govt)
  end

end