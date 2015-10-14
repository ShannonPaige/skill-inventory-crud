ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'
require 'tilt/erb'

class Minitest::Test
  def create_skills(num)
    num.times do |i|
      SkillInventory.create({ :title        => "this is #{i+1} title",
                              :description  => "this is #{i+1} description"})
    end
  end
  
  def teardown
    SkillInventory.delete_all
  end
end

Capybara.app = SkillInventoryApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
end
