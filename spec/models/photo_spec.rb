require 'spec_helper'

describe Photo do

  before(:each) do
    @album = FactoryGirl.create(:folder)
  end

  it { should have_many(:taggings) }
  it { should have_many(:tags).through(:taggings) }
  it { should belong_to(:folder)   }

  def instentiate_photo
    @photo = Photo.new
  end

  it "should save the valid object" do
    instentiate_photo
    @photo.pic    = File.new(Rails.root + "spec/data/image.jpg")
    @photo.folder = @album
    @photo.valid?.should be_true
    @photo.save.should be_true
  end

  it "should save only valid content type for the image" do
    instentiate_photo
    @photo.pic    = File.new(Rails.root + "spec/data/document")
    @photo.folder = @album
    @photo.save.should be_false
    @photo.errors_on(:pic_content_type).first.should eq("File type must be in .jpg .gif .png .bmp")
  end

  it "should not save the record if no image is present" do
    instentiate_photo
    @photo.folder = @album
    @photo.save.should be_false
    @photo.errors_on(:pic).first.should eq("Can't be blank")
  end

  it "should save tags for the photo uplaoded if given" do
    instentiate_photo
    @photo.pic        = File.new(Rails.root + "spec/data/image.jpg")
    @photo.folder     = @album
    @photo.tag_names  = "tag1,tag2,tag3"
    @photo.save.should be_true
    @photo.tags.count.should eq(3)
    @photo.tag_names.should eq("tag1, tag2, tag3")
  end

end
