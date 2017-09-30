require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter][:christmas] << "Balloons"
  holiday_hash[:winter][:new_years] << "Balloons"
end


def add_supply_to_memorial_day(holiday_hash, supply)

holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
holiday_hash[season][holiday_name] = supply_array

holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  holiday_hash.each do |season, holiday|
    fixed_season = season.to_s.capitalize!
    puts "#{fixed_season}:"
    holiday.each do |key, value|
      holiday_array = key.to_s.gsub('_',' ').split
      fixed_holiday = ""
      holiday_array.each do |word|
        if holiday_array[-1] == word
          fixed_holiday << word.capitalize!
        elsif fixed_holiday << word.capitalize! + " "
        end
      end
      all_supplies = ""
      value.each do |word|
        if value[-1] == word
          all_supplies << word
        elsif all_supplies << word + ", "
        end
      end
      puts "  #{fixed_holiday}: #{all_supplies}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holidays = []
  holiday_hash.each do |season, holiday|
    holiday.each do |key, supply|
      if supply.include?("BBQ")
        holidays << key
      end
    end    
  end
  holidays
end
