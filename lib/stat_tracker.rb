
# require_relative './spec_helper'
require_relative 'game_stats'

class StatTracker

  def highest_total_score
    GameStats.highest_total_score
  end

  def lowest_total_score
    GameStats.lowest_total_score
  end
end

  