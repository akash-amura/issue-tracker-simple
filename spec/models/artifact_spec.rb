require 'rails_helper'

RSpec.describe Artifact, type: :model do
  it "is invalid without a title" do
    artifact = Artifact.new(title:nil)
    artifact.valid?
    expect(artifact.errors[:title]).to include("can't be blank")
  end
  it "is invalid without  a category" do
    artifact = Artifact.new(title:nil)
    artifact.valid?
    expect(artifact.errors[:category]).to include("can't be blank")
  end
  it "is invalid without a ticket" do 
    artifact = Artifact.new
    artifact.valid?
    expect(artifact.errors[:ticket]).to include("can't be blank")
  end
end
