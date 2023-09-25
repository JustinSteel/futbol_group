require_relative './lib/stat_tracker'

  stat_tracker = StatTracker.new
  stat_tracker.highest_total_score
  stat_tracker.lowest_total_score
  stat_tracker.percentage_home_wins
  require 'pry'; binding.pry

