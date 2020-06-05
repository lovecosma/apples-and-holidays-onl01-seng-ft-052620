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

holiday_hash.each do |season, holiday|
  if season == :winter
  holiday.each do |day, value|
    holiday_hash[:winter][:christmas][2] = supply if day == :christmas
    holiday_hash[:winter][:new_years][1] = supply if day == :new_years
  end
  end
end

end

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
holiday_hash[:spring][:memorial_day][1] = supply
holiday_hash[:spring][:memorial_day][2] = supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
holiday_hash[season]= {}
holiday_hash[season][holiday_name] = {}
holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
holiday_hash.keys.each do |season, next_key|
if season == :winter
return holiday_hash[season].values.flatten
end
end
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
holiday_hash.each do |seasons, holidays|
  if seasons == :winter
      puts "Winter:"
      holidays.each do |day, value_array|
      if day == :christmas
      puts "  Christmas: #{value_array[0]}, #{value_array[1]}"
      end
      if day == :new_years
      puts "  New Years: #{value_array[0]}"
      end
    end
  end
  if seasons == :summer
      puts "Summer:"
      holidays.each do |day, value_array|
      if day == :fourth_of_july
      puts "  Fourth Of July: #{value_array[0]}, #{value_array[1]}"
      end
    end
  end
  if seasons == :fall
      puts "Fall:"
      holidays.each do |day, value_array|
      if day == :thanksgiving
      puts "  Thanksgiving: #{value_array[0]}"
      end
    end
  end
   if seasons == :spring
      puts "Spring:"
      holidays.each do |day, value_array|
      if day == :memorial_day
      puts "  Memorial Day: #{value_array[0]}"
      end
    end
  end
end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  answers = []
holiday_hash.each do |season, holiday|
  holiday.each do |day, value_array|
    value_array.each do |value|
      answers << day if value == "BBQ"
    end
  end
  end
  return answers
end
