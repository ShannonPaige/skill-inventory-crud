require_relative "../test_helper"

class DeleteSkillTest < FeatureTest

  def test_user_can_delete_a_skill
    create_skills(1)
    visit '/skills'

    assert page.has_content?("this is 1 title")

    click_button 'Delete'

    assert_equal '/skills', current_path
    refute page.has_content?("this is 1 title")
  end

end
