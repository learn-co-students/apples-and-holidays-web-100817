require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
  # return the second element in the 4th of July array
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].each do |holiday, supplies|
    supplies << supply
  end
end

def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  winter_holiday_supplies = []
  holiday_hash[:winter].each do |holiday, supply_array|
    winter_holiday_supplies << supply_array
  end
  return winter_holiday_supplies.flatten
end

{:winter=>{:christmas=>["Lights", "Wreath"], :new_years=>["Party Hats"]},
 :summer=>{:fourth_of_july=>["Fireworks", "BBQ"]},
 :fall=>{:thanksgiving=>["Turkey"]},
 :spring=>{:memorial_day=>["BBQ"]}}

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holiday_info|
    puts season.to_s.capitalize + ":"
    holiday_info.each do |holiday, supply_array|
      holiday_string = "  "
      holiday_string += holiday.to_s.split("_").map(&:capitalize).join(" ")
      holiday_string += ": "
      supply_array.each_with_index do |supply, index|
        holiday_string += supply
        unless index == (supply_array.length - 1)
          holiday_string += ", "
        else
          puts holiday_string
        end
      end
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  holidays_with_bbq = []
  holiday_hash.each do |season, holiday_info|
    holiday_info.each do |holiday, supply_array|
      holidays_with_bbq << holiday if supply_array.include?("BBQ")
    end
  end
  return holidays_with_bbq
end
