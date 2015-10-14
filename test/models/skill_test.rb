require_relative "../test_helper.rb"

class SkillTest < Minitest::Test
  def test_attributes_are_assigned_correctly
    skill = Skill.new({ "id"          => "1",
                      "title"       => "skill title",
                      "description" => "do it"})

    assert_equal "1", skill.id
    assert_equal "skill title", skill.title
    assert_equal "do it", skill.description
  end
end
