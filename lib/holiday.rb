require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_supplies[:winter][:christmas].push(supply)
  holiday_supplies[:winter][:new_years].push(supply)
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_supplies[:spring][:memorial_day].push(supply)
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  answer = []
  holiday_hash[:winter].each do |holiday, supplies|
    answer.push(supplies)
  end
answer.flatten
end

def all_supplies_in_holidays(holiday_hash)
    holiday_hash.each do |season, holidays|
      puts season.to_s.capitalize! + ":"
      holidays.each do |holiday, supply|
      temp = holiday
      temp = temp.to_s.tr("_", " ").split
        puts "  #{temp.map(&:capitalize!).join(" ")}: #{supply.join(", ")}"
      end
    end
end

def all_holidays_with_bbq(holiday_hash)
  answer = []
  holiday_hash.each do |season, holidays|
    holidays.each do |holiday, supplies|
      if supplies.include?("BBQ")
        answer.push(holiday)
      end
    end
  end
  answer
end
