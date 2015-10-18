ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'
require 'tilt/erb'

DatabaseCleaner[:sequel, { :connection => Sequel.sqlite("db/skill_inventory_test.sqlite3") }].strategy = :truncation


class Minitest::Test
  def create_skills(num)
    num.times do |i|
      SkillInventory.create({ :title        => "this is #{i+1} title",
                              :description  => "this is #{i+1} description"})
    end
  end

  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end

Capybara.app = SkillInventoryApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
end
