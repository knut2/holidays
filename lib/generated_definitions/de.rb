# encoding: utf-8
module Holidays
  # This file is generated by the Ruby Holidays gem.
  #
  # Definitions loaded: definitions/de.yaml
  #
  # To use the definitions in this file, load it right after you load the
  # Holiday gem:
  #
  #   require 'holidays'
  #   require 'generated_definitions/de'
  #
  # All the definitions are available at https://github.com/alexdunae/holidays
  module DE # :nodoc:
    def self.defined_regions
      [:de, :de_bw, :de_by, :de_he, :de_nw, :de_rp, :de_sl, :de_sn_aux, :de_th_aux, :de_sn, :de_st, :de_by_aux, :de_bb, :de_mv, :de_th]
    end

    def self.holidays_by_month
      {
              0 => [{:function => lambda { |year| Holidays.easter(year)-2 }, :function_id => "easter(year)-2", :name => "Karfreitag", :regions => [:de]},
            {:function => lambda { |year| Holidays.easter(year) }, :function_id => "easter(year)", :type => :informal, :name => "Ostersonntag", :regions => [:de]},
            {:function => lambda { |year| Holidays.easter(year)+1 }, :function_id => "easter(year)+1", :name => "Ostermontag", :regions => [:de]},
            {:function => lambda { |year| Holidays.easter(year)+39 }, :function_id => "easter(year)+39", :name => "Christi Himmelfahrt", :regions => [:de]},
            {:function => lambda { |year| Holidays.easter(year)+49 }, :function_id => "easter(year)+49", :type => :informal, :name => "Pfingstsonntag", :regions => [:de]},
            {:function => lambda { |year| Holidays.easter(year)+50 }, :function_id => "easter(year)+50", :name => "Pfingstmontag", :regions => [:de]},
            {:function => lambda { |year| Holidays.easter(year)+60 }, :function_id => "easter(year)+60", :name => "Fronleichnam", :regions => [:de_bw, :de_by, :de_he, :de_nw, :de_rp, :de_sl, :de_sn_aux, :de_th_aux]},
            {:function => lambda { |year| Holidays.easter(year)-52 }, :function_id => "easter(year)-52", :type => :informal, :name => "Weiberfastnacht", :regions => [:de_bw, :de_by, :de_he, :de_nw, :de_rp, :de_sl, :de_sn]},
            {:function => lambda { |year| Holidays.easter(year)-48 }, :function_id => "easter(year)-48", :type => :informal, :name => "Rosenmontag", :regions => [:de_bw, :de_by, :de_he, :de_nw, :de_rp, :de_sl, :de_sn]},
            {:function => lambda { |year| Holidays.easter(year)-46 }, :function_id => "easter(year)-46", :type => :informal, :name => "Aschermittwoch", :regions => [:de_bw, :de_by, :de_he, :de_nw, :de_rp, :de_sl, :de_sn]}],
      1 => [{:mday => 1, :name => "Neujahrstag", :regions => [:de]},
            {:mday => 6, :name => "Heilige Drei Könige", :regions => [:de_bw, :de_by, :de_st]}],
      5 => [{:mday => 1, :name => "Tag der Arbeit", :regions => [:de]}],
      8 => [{:mday => 15, :name => "Mariä Himmelfahrt", :regions => [:de_by, :de_sl]},
            {:mday => 8, :name => "Friedensfest", :regions => [:de_by_aux]}],
      10 => [{:mday => 3, :name => "Tag der Deutschen Einheit", :regions => [:de]},
            {:mday => 31, :name => "Reformationstag", :regions => [:de_bb, :de_mv, :de_sn, :de_st, :de_th, :de]},
            {:mday => 31, :type => :informal, :name => "Reformationstag", :regions => [:de_bw]}],
      11 => [{:mday => 1, :name => "Allerheiligen", :regions => [:de_bw, :de_by, :de_nw, :de_rp, :de_sl]},
            {:function => lambda { |year| Holidays.de_buss_und_bettag(year) }, :function_id => "de_buss_und_bettag(year)", :name => "Buß- und Bettag", :regions => [:de_sn]},
            {:function => lambda { |year| Holidays.de_buss_und_bettag(year) }, :function_id => "de_buss_und_bettag(year)", :type => :informal, :name => "Buß- und Bettag", :regions => [:de]}],
      12 => [{:mday => 24, :type => :informal, :name => "Heilig Abend", :regions => [:de]},
            {:mday => 25, :name => "1. Weihnachtstag", :regions => [:de]},
            {:mday => 26, :name => "2. Weihnachtstag", :regions => [:de]},
            {:mday => 31, :type => :informal, :name => "Silvester", :regions => [:de]}]
      }
    end
  end

# Germany: Wednesday before November 23
def self.de_buss_und_bettag(year)
  date = Date.civil(year,11,23)
  if date.wday > 3
    date -= (date.wday - 3)
  else
    date -= (date.wday + 4)
  end
  date
end



end

Holidays.merge_defs(Holidays::DE.defined_regions, Holidays::DE.holidays_by_month)
