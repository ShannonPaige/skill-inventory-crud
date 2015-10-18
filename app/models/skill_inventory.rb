require 'yaml/store'

class SkillInventory

  def self.dataset
    database.from(:skills)
  end

  def self.create(skill)
    dataset.insert(skill)
  end

  def self.database
    if ENV["RACK_ENV"] == "test"
      @database ||= Sequel.sqlite("db/skill_inventory_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/skill_inventory_development.sqlite3")
    end
  end

  def self.all
    dataset.to_a.map { |data| Skill.new(data) }
  end

  def self.find(id)
    Skill.new(dataset.where(:id => id).to_a.first)
  end

  def self.update(id, data)
    dataset.where(:id => id).update(data)
  end

  def self.delete(id)
    dataset.where(:id => id).delete
  end
end
