require 'csv'
require_relative './game'
require_relative './teams'
require_relative './game_team'

module Data
  
  def self.create_games(path)
    Game.reset
    data = CSV.parse(File.read(path), headers: true, header_converters: :symbol)
    data.map do |row|
      Game.new(row)
    end
    # require 'pry'; binding.pry
  end
  def self.create_game_teams(path)
    GameTeam.reset
    data = CSV.parse(File.read(path), headers: true, header_converters: :symbol)
    data.map do |row| 
      GameTeam.new(row)
    end
  end
  def self.create_teams(path)
    Team.reset
    data = CSV.parse(File.read(path), headers: true, header_converters: :symbol)
    data.map do |row|
      Team.new(row)
    end
  end

  PATHS = {
    game: './data/games.csv',
    team: './data/teams.csv',
    game_team: './data/game_teams.csv'
  }
  
  def self.game
    Game.reset
    data = CSV.parse(File.read(PATHS[:game]), headers: true, header_converters: :symbol)
    data.map do |row|
      Game.new(row)
    end
  end
  
  def self.team
    Team.reset
    data = CSV.parse(File.read(PATHS[:team]), headers: true, header_converters: :symbol)
    data.map do |row|
      Team.new(row)
    end
    Team.teams
  end
  
  def self.game_teams
    GameTeam.reset
    data = CSV.parse(File.read(PATHS[:game_team]), headers: true, header_converters: :symbol)
    data.map do |row|
      GameTeam.new(row)
    end
    GameTeam.gameteam
  end

end

