require './spec/spec_helper'
require_relative 'data'

class GameStats

  include Data

  def self.highest_total_score
    goals_per_game = Data.get_data.reduce([]) do |arr, game|
      temp_hash = {}
      if arr.last && arr.last.keys[0] == game[:game_id]
        goals = arr.last.values[0]
        temp_hash[game[:game_id]] = goals + game[:goals].to_i
        arr.pop
        arr << temp_hash
      else
        temp_hash[game[:game_id]] = game[:goals].to_i
        arr << temp_hash
        temp_hash = {}
      end
      arr
    end.sort do |gm1, gm2|
      gm2.values[0] <=> gm1.values[0]
    end
    highest_score_id = goals_per_game[0].keys[0]
    highest_scoring_game = Data.get_data.find_all do |game|
      game[:game_id] == highest_score_id
    end
    highest_scoring_game
  end

  # def self.lowest_total_score
  #   Data.get_data.min_by do |game|
  #     game[:home_goals] + game[:away_goals]
  #   end
  # end

  # def self.percentage_home_wins
  #   Data.get_data.map do |game|
      
  #   end
  # end
    # require 'pry'; binding.pry
    # home_win_percent = Data.get_data.reduce({0}) do |hash,game|
    #   if game[:hoa] == "home" && game[:result] == "win"
    #     hash[:home_wins] += 1
    #   end
    #   hash[:total_games] += 1
    #   hash
    # end
    # home_win_percent[:home_wins]/home_win_percent[:total_games]
  # end
end