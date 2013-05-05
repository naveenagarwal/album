require 'spec_helper'

describe Folder do
  
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  def instentiate_album
    @album      = Folder.new
    @album.name = "My first album"    
  end

  it { should have_many(:photos) }
  it { should belong_to(:user) }

  it "should be associated with user" do
    instentiate_album
    @album.valid?.should be_false
    @album.errors_on(:user).first.should eql("Can't be blank") 
  end

  it "should be valid when associated with user" do
    instentiate_album
    @album.user = @user
    @album.valid?.should be_true
    @album.errors.should be_blank 
  end

  it 'should save the valid record' do
    instentiate_album
    @album.user = @user
    @album.valid?.should be_true
    @album.save.should be_true
  end

end
