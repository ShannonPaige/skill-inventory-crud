require_relative "../test_helper"

class EditSkillTest < FeatureTest

  def test_user_can_edit_a_skill
    create_skills(1)
    visit '/skills'

    assert page.has_content?("this is 1 title")

    click_link 'Edit'

    assert_equal '/skills/1/edit', current_path

    fill_in 'skill[title]', with: "Bow Hunting Skills"
    fill_in 'skill[description]', with: "hunting with a bow"
    click_button 'submit'

    assert_equal '/skills', current_path
    refute page.has_content?("this is 1 title")
    assert page.has_content?("Bow Hunting Skills")
  end

end
