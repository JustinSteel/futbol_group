class Team
  @@teams = []
  attr_reader :team_id,
              :franchise_id,
              :team_name,
              :abbreviation,
              :stadium,
              :link

  def initialize(attributes)
    @team_id      = attributes[:team_id]
    @franchise_id = attributes[:franchiseid]
    @team_name    = attributes[:teamname]
    @abbreviation = attributes[:abbreviation]
    @stadium = attributes[:stadium]
    @link = attributes[:link]
    @@teams << self
  end

  def self.teams
    @@teams
  end

  def self.reset
    @@teams = []
  end
end