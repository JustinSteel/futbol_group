require 'csv'

module Data

  LOCATIONS = {
    games: './data/games.csv',
    teams: './data/teams.csv',
    game_teams: './data/game_teams.csv'
  }

  DATA = CSV.open LOCATIONS[:game_teams], headers: true, header_converters: :symbol
  
  def self.get_data
    data = DATA
    data.rewind
    return data
  end
end

# Data.get_data.each.with_index do |row, index|
#   p row if index == 0
# end