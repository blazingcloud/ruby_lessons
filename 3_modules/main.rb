require "week"

class Decade
  include Week
  NUM_YEARS = 10

  def num_weeks
    NUM_YEARS * Week::weeks_in_year
  end
end
