# Ruby Holidays Gem [![Build Status](https://travis-ci.org/holidays/holidays.svg?branch=master)](https://travis-ci.org/holidays/holidays) [![Coverage Status](https://coveralls.io/repos/holidays/holidays/badge.svg)](https://coveralls.io/r/holidays/holidays)

A set of functions to deal with holidays in Ruby.

Extends Ruby's built-in Date class and supports custom holiday definition lists.

Full documentation can be found [here](http://www.rubydoc.info/github/alexdunae/holidays/master/frames).

## Installation

To install the gem from RubyGems:

    gem install holidays

The Holidays gem is tested on Ruby 2.0.0, 2.1.0, 2.2.0, 2.3.0 and JRuby.

The Holidays gem follows [semantic versioning](http://semver.org/). Please take this into account when relying on this gem as a dependency.

## Time zones

Time zones are ignored.  This library assumes that all dates are within the same time zone.

### Using the Holidays class

Get all holidays on April 25, 2008 in Australia.

    date = Date.civil(2008,4,25)

    Holidays.on(date, :au)
    => [{:name => 'ANZAC Day',...}]

Get holidays that are observed on July 2, 2007 in British Columbia, Canada.

    date = Date.civil(2007,7,2)

    Holidays.on(date, :ca_bc, :observed)
    => [{:name => 'Canada Day',...}]

Get all holidays in July, 2008 in Canada and the US.

    from = Date.civil(2008,7,1)
    to = Date.civil(2008,7,31)

    Holidays.between(from, to, :ca, :us)
    => [{:name => 'Canada Day',...}
        {:name => 'Independence Day',...}]

Get informal holidays in February.

    from = Date.civil(2008,2,1)
    to = Date.civil(2008,2,15)

    Holidays.between(from, to, :informal)
    => [{:name => 'Valentine\'s Day',...}]

### Loading Custom Definitions on the fly

Load custom definitions file on the fly and use them immediately.

Load custom 'Company Founding' holiday on June 1st:

    Holidays.load_custom('/home/user/holiday_definitions/custom_holidays.yaml')

    date = Date.civil(2013,6,1)

    Holidays.on(date, :my_custom_region)
      => [{:name => 'Company Founding',...}]

Custom definition files must match the format of the existing definition YAML files location in the 'definitions' directory.

Multiple files can also be passed:

    Holidays.load_custom('/home/user/holidays/custom_holidays1.yaml', '/home/user/holidays/custom_holidays2.yaml')

### Extending Ruby's Date class

To extend the 'Date' class:

    require 'holidays/core_extensions/date'
    class Date
      include Holidays::CoreExtensions::Date
    end

Now you can check which holidays occur in Iceland on January 1, 2008:

    d = Date.civil(2008,7,1)

    d.holidays(:is)
    => [{:name => 'Nýársdagur'}...]

Or lookup Canada Day in different regions:

    d = Date.civil(2008,7,1)

    d.holiday?(:ca) # Canada
    => true

    d.holiday?(:ca_bc) # British Columbia, Canada
    => true

    d.holiday?(:fr) # France
    => false

Or you can calculate the day of the month:

    Date.calculate_mday(2015, 4, :first, 2)
    => 7

### Caching Holiday Lookups

If you are checking holidays regularly you can cache your results for improved performance. Run this before looking up a holiday (eg. in an initializer):

    Holidays.cache_between(Time.now, 2.years.from_now, :ca, :us, :observed)

Holidays for the regions specified within the dates specified will be pre-calculated.

See the [original pull request](https://github.com/alexdunae/holidays/pull/36) for more details.

### How to contribute

#### For definition updates

* Edit desired definition YAML file(s) located under `definitions/`. If you are adding a new region be sure to update `definitions/index.yaml` as well
* Run `bundle exec rake generate` to generate updated final definitions (they will be located under `lib/generated_definitions/`)
* Run `bundle exec rake test` to ensure your changes did not introduce errors
* Open a PR with *all* of these changes. You *MUST* include the generated definition files in your PR. There is no automatic process to generated definitions at this time

Including documentation with your updates is very much appreciated. A simple Wikipedia entry or government link in the comments alongside your changes would be perfect.

Lastly, note that there are many 'meta' regions. For example, there are regions for Europe, Scandinavia, and North America. If your new region(s) falls into these areas consider adding them. You can find these 'meta' regions in `definitions/index.yaml`.

#### For non-definition functionality

* Fork the repository
* Make your changes
* Create a PR pointing back to `master`

Don't worry about versioning, we'll handle it on our end.

Tests are required. If your PR results in lower test coverage then it will not be accepted.

### Credits and code

* Started by [Alex Dunae](http://dunae.ca) (e-mail 'code' at the same domain), 2007-12
* Maintained by [Hana Wang](https://github.com/hahahana), 2013
* Maintained by [Phil Trimble](https://github.com/ptrimble), 2014-present

Plus all of these [wonderful contributors!](https://github.com/alexdunae/holidays/contributors)
