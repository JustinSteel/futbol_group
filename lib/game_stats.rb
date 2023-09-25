require 'pry-nav'
require_relative 'Data'
require_relative 'game'

module GameStats

  # include Data

  def highest_total_score
    most_goals_game = Game.games.reduce(0) do |goals, game|
      game_goals = game.home_goals.to_i + game.away_goals.to_i
      if game_goals > goals
        goals = game_goals
      end
      goals
    end
    most_goals_game
  end

  def lowest_total_score
    fewest_goals_game = Game.games.reduce(0) do |goals, game|
      game_goals = game.home_goals.to_i + game.away_goals.to_i
      if game_goals < goals
        goals = game_goals
      end
      goals
    end
    fewest_goals_game
  end

  def percentage_home_wins
    home_wins = GameTeam.gameteam.count do |game|
      game.hoa == "home" && game.result == "WIN"
    end 
    (home_wins.to_f / Game.games.count.to_f).round(2)
  end

end