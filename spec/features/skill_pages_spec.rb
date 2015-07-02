require 'rails_helper'

describe "The add a skill process" do
  it "adds a skill" do
    visit skills_path
    click_on "Add New Skill"
    fill_in 'Name', :with => 'skill name'
    fill_in 'Description', :with => 'skill description'
    click_on 'Create Skill'
    expect(page).to have_content 'skill name'
  end

  it "gives error when no name is entered" do
    visit new_skill_path
    click_on 'Create Skill'
    expect(page).to have_content 'errors'
  end
end

describe "The edit a skill process" do
  it "edits a skill" do
    skill = Skill.create(:name => 'test skill')
    visit skills_path
    click_on 'Edit'
    fill_in 'Description', :with => 'test skill description'
    click_on 'Update Skill'
    expect(page).to have_content 'Skill successfully updated!'
  end
end

describe "The delete a skill process" do
  it "deletes a skill" do
    skill = Skill.create(:name => 'test skill')
    visit skills_path
    click_on 'Delete'
    expect(page).to_not have_content 'test skill'
  end
end
