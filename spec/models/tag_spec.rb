require 'spec_helper'

describe Tag do

  it { should have_many(:taggings) }
  it { should have_many(:photos).through(:taggings) }

  it "should not save without name" do
    @tag = Tag.new
    @tag.save.should be_false
    @tag.errors_on(:name).first.should eq("Can't be blank")
  end

  it "should save with name" do
    @tag      = Tag.new
    @tag.name = "tag1"
    @tag.save.should be_true
  end

end
