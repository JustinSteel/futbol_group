require 'pry-nav'
require_relative 'data'
require_relative 'game'

module GameStats

  # include Data

  def highest_total_score
    most_goals_game = Game.games.reduce(0) do |most_goals, game|
      goals = game.home_goals.to_i + game.away_goals.to_i
      game_goals > most_goals ? most_goals[0] = goals : most_goals
      most_goals
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

  def percentage_visitor_wins
    away_wins = GameTeam.gameteam.count do |game|
      game.hoa == "away" && game.result == "WIN"
    end 
    (away_wins.to_f / Game.games.count.to_f).round(2)
  end

  def percentage_ties 
    ties = Game.games.count do |game|
      game.away_goals.to_f == game.home_goals.to_f
    end.to_f
    (ties/Game.games.count).round(2)
  end

  def percentage_calculator(portion, whole)
    percentage = (portion/whole).round(2)
  end

end