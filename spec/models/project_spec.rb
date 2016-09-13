require 'rails_helper'

RSpec.describe Project, type: :model do
  it "is invalid without title" do
    project = Project.new(title:nil)
    project.valid?
    expect(project.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a manager" do 
    project = Project.new
    project.valid?
    expect(project.errors[:manager]).to include("can't be blank")
  end

  it "is invalid without a creator" do
    project = Project.new
    project.valid?
    expect(project.errors[:user]).to include("can't be blank")
  end
end
