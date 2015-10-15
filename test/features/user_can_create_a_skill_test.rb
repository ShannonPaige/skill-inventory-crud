require_relative "../test_helper"

class CreateSkillTest < FeatureTest

  def test_user_can_create_a_skill
    visit '/skills/new'

    assert_equal '/skills/new', current_path

    fill_in 'skill[title]', with: "Bow Hunting Skills"
    fill_in 'skill[description]', with: "hunting with a bow"
    click_button 'submit'

    assert_equal '/skills', current_path
    assert page.has_content?("Bow Hunting Skills")
  end

end
