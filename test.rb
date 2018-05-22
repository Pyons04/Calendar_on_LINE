require "rails"
this_day = Date.today
puts this_monday = this_day - (this_day.wday - 1)
puts this_tuesday = this_day-(this_day.wday-2)
puts this_wednesday = this_day-(this_day.wday-3)
puts this_thursday = this_day-(this_day.wday-4)
puts this_friday = this_day-(this_day.wday-5)
puts this_saturday = this_day-(this_day.wday-6)
puts this_sunday = this_day-(this_day.wday-7)
puts("--------------------------------------------")
puts next_monday = this_day - (this_day.wday - 1-7)
puts next_tuesday = this_day-(this_day.wday-2-7)
puts next_wednesday = this_day-(this_day.wday-3-7)
puts next_thursday = this_day-(this_day.wday-4-7)
puts next_friday = this_day-(this_day.wday-5-7)
puts next_saturday = this_day-(this_day.wday-6-7)
puts next_sunday = this_day-(this_day.wday-7-7)

