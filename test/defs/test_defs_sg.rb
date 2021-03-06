# encoding: utf-8
require File.expand_path(File.dirname(__FILE__)) + '/../test_helper'

# This file is generated by the Ruby Holiday gem.
#
# Definitions loaded: definitions/sg.yaml
class SgDefinitionTests < Test::Unit::TestCase  # :nodoc:

  def test_sg
{Date.civil(2014,1,1) => 'New Year\'s Day', 
 Date.civil(2014,2,14) => 'Valentine\'s Day',
 Date.civil(2014,2,15) => 'Total Defence Day',
 Date.civil(2014,4,18) => 'Good Friday',
 Date.civil(2014,5,1) => 'Labour Day',
 Date.civil(2014,8,9) => 'National Day',
 Date.civil(2014,12,25) => 'Christmas Day'}.each do |date, name|
  assert_equal name, (Holidays.on(date, :sg, :informal)[0] || {})[:name]
end
  end
end
