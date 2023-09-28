require 'csv'
require_relative './game'
require_relative './teams'
require_relative './game_team'
require_relative './stat_tracker'

module Data

  PATHS = {
    game: './data/games.csv',
    team: './data/teams.csv',
    game_team: './data/game_teams.csv'
  }
  
  def self.game
    data = CSV.parse(File.read(PATHS[:game]), headers: true, header_converters: :symbol)
    data.map do |row|
      Game.new(row)
    end
    Game.games
  end
  
  def self.team
    data = CSV.parse(File.read(PATHS[:team]), headers: true, header_converters: :symbol)
    data.map do |row|
      Team.new(row)
    end
    Team.teams
  end
  
  def self.game_teams
    data = CSV.parse(File.read(PATHS[:game_team]), headers: true, header_converters: :symbol)
    data.map do |row|
      GameTeam.new(row)
    end
    GameTeam.gameteam
  end
end

