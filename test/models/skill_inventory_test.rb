require_relative "../test_helper.rb"

class SkillInventoryTest < Minitest::Test

  def test_find_a_skill_by_id_number
    create_skills(3)
    skill = SkillInventory.find(SkillInventory.all.first.id)

    assert_equal SkillInventory.all.first.id, skill.id
    assert_equal "this is 1 title", skill.title
    assert_equal "this is 1 description", skill.description
  end

  def test_skill_is_created
    create_skills(1)
    skill = SkillInventory.find(SkillInventory.all.first.id)

    assert_equal SkillInventory.all.first.id, skill.id
    assert_equal "this is 1 title", skill.title
    assert_equal "this is 1 description", skill.description
  end

  def test_skill_is_updated
    create_skills(1)
    data = {:title => "New Title", :description => "New Description"}
    SkillInventory.update(SkillInventory.all.first.id, data)
    skill = SkillInventory.find(SkillInventory.all.first.id)

    assert_equal SkillInventory.all.first.id, skill.id
    assert_equal "New Title", skill.title
    assert_equal "New Description", skill.description
  end

  def test_skill_is_deleted
    create_skills(3)
    total = SkillInventory.all.count
    SkillInventory.delete(SkillInventory.all.first.id)

    assert_equal (total - 1), SkillInventory.all.count
  end

  def test_all_skills_are_returned
    create_skills(3)
    all_skills = SkillInventory.all
    ids = all_skills.map { |skill| skill.id }
    titles = all_skills.map { |skill| skill.title }
    descriptions = all_skills.map { |skill| skill.description }

    assert_equal 3, SkillInventory.all.count
    assert_equal ["this is 1 title", "this is 2 title", "this is 3 title"], titles
    assert_equal ["this is 1 description", "this is 2 description", "this is 3 description"], descriptions
  end
end
