require 'csv'

module Data

  LOCATIONS = {
    games: './data/games.csv',
    teams: './data/teams.csv',
    game_teams: './data/game_teams.csv'
  }
  
  def self.get_data
    CSV.open LOCATIONS[:games], headers: true, header_converters: :symbol
  end
end