require 'rails_helper'

describe "the add a project process" do
  it "adds a new project" do
    visit projects_path
    click_on 'Add New Project'
    fill_in 'Name', :with => 'test name'
    fill_in 'Description', :with => 'test description'
    fill_in 'Github', :with => 'test github'
    click_on 'Create Project'
    expect(page).to have_content 'test name'
  end

  it "gives error when no name is entered" do
    visit new_project_path
    click_on 'Create Project'
    expect(page).to have_content 'errors'
  end
end

describe "the edit a project process" do
  it "edits a project" do
    project = Project.create(:name => 'test project')
    visit project_path(project)
    click_on 'Edit'
    fill_in 'Description', :with => 'test description'
    fill_in 'Github', :with => 'test github link'
    click_on 'Update Project'
    expect(page).to have_content 'test description'
  end
end
