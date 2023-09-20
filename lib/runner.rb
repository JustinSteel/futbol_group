require 'pry-nav'
require './spec/spec_helper'
require './lib/stat_tracker'
require './lib/game_stats'
require_relative 'data'


p StatTracker.new.highest_total_score

p StatTracker.new.lowest_total_score

