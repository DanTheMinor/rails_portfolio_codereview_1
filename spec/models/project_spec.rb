require 'rails_helper'

describe Project do
  it { should validate_presence_of :name }
  it { should belong_to :skill}
end
