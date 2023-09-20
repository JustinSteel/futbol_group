require './spec/spec_helper'
require_relative 'data'

class GameStats

  include Data

  def self.highest_total_score
    Data.get_data.max_by do |game|
      game[:home_goals] + game[:away_goals]
    end
  end

  def self.lowest_total_score
    Data.get_data.min_by do |game|
      game[:home_goals] + game[:away_goals]
    end
  end
end

