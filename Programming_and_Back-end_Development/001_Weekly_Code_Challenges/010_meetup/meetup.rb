# Meetup Class
class Meetup
  WEEKDAYS = {
    sunday: 0,
    monday: 1,
    tuesday: 2,
    wednesday: 3,
    thursday: 4,
    friday: 5,
    saturday: 6
  }
  POSITION = {
    first: 0,
    second: 1,
    third: 2,
    fourth: 3
  }
  TEENTH_DAYS = [13, 14, 15, 16, 17, 18, 19]

  def initialize(month, year)
    @month = month
    @year = year
    @possible_dates = []
  end

  def day(day_of_week_sym, ordinal_sym)
    @week_day = WEEKDAYS[day_of_week_sym]

    day = first_valid_day
    date = Date.new(@year, @month, day)

    loop do
      @possible_dates << date if date.wday == @week_day
      date = date.next
      break if date.mon != @month
    end

    find_date(ordinal_sym)
  end

  private

  def first_valid_day
    day = 1
    loop do
      return day if Date.valid_date?(@year, @month, day)
      day + 1
    end
  end

  def find_date(ordinal_sym)
    case ordinal_sym
    when :teenth
      @possible_dates.each do |possible_date|
        return possible_date if TEENTH_DAYS.include?(possible_date.mday)
      end
    when :last
      return @possible_dates.last
    else
      return @possible_dates[POSITION[ordinal_sym]]
    end
  end
end
