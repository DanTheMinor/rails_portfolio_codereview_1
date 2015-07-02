require 'rails_helper'

describe "The add a project process" do
  it "adds a project" do
    skill = Skill.create(:name => 'test skill')
    visit skill_path(skill)
    click_on "Add a new Project to this Skill"
    fill_in 'Name', :with => 'project name'
    fill_in 'Description', :with => 'project description'
    click_on 'Create Project'
    expect(page).to have_content 'project name'
  end

  it "gives error when no name is entered" do
    skill = Skill.create(:name => 'test skill')
    visit skill_path(skill)
    click_on "Add a new Project to this Skill"
    click_on 'Create Project'
    expect(page).to have_content 'errors'
  end
end

describe "The edit a project process" do
  it "edits a project" do
    skill = Skill.create(:name => 'test skill')
    project = Project.create(:name => 'test project', :skill_id => skill.id)
    visit skill_path(skill)
    click_on "Edit"
    fill_in 'Name', :with => 'new project name'
    click_on 'Update Project'
    expect(page).to have_content 'Project successfully updated!'
  end
end

describe "The delete a project process" do
  it "deletes a project" do
    skill = Skill.create(:name => 'test skill')
    project = Project.create(:name => 'test project', :skill_id => skill.id)
    visit skill_path(skill)
    click_on "Delete"
    expect(page).to_not have_content 'test project'
  end
end
