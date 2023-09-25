require 'pry-nav'
require_relative 'Data'

module GameStats

  include Data

  def self.highest_total_score
    most_goals_game = Data.game.reduce(0) do |goals, game|
      game_goals = game.home_goals.to_i + game.away_goals.to_i
      if game_goals > goals
        goals = game_goals
      end
      goals
    end
    most_goals_game
  end

end