require 'pry-nav'

module GameStats

  def highest_total_score(game_data)
    most_goals_game = game_data.reduce(0) do |goals, game|
      game_goals = game.home_goals.to_i + game.away_goals.to_i
      if game_goals > goals
        goals = game_goals
      end
      goals
    end
    most_goals_game
  end

end