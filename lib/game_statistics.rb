require 'pry-nav'


module GameStatistics

  def self.create_games(path)
    data = CSV.parse(File.read(path), headers: true, header_converters: :symbol)
    data.map do |row|
      Game.new(row)
    end
  end

  GAME_PATH ='./data/games.csv'

  GAME_DATA = create_games(GAME_PATH)
  require 'pry'; binding.pry

  def self.highest_total_score
    most_goals_game = GAME_DATA.reduce(0) do |goals, game|
      game_goals = game.home_goals.to_i + game.away_goals.to_i
      if game_goals > goals
        goals = game_goals
      end
      goals
    end
    most_goals_game
  end

end