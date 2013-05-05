require 'spec_helper'
include Devise::TestHelpers

describe AlbumsController do

  # This should return the minimal set of attributes required to create a valid album
  def valid_attributes
    {name: "My first album", user_id: @user.id}
  end

  def valid_params
    {
      :folder => {
        :name => "My first album"
      }
    }
  end

  def invalid_params
    {
      :folder => {
        :name => ""
      }
    }
  end

  describe "With user signed in" do

    before (:each) do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    describe "GET 'index'" do
      it "should assigns all albums as @albums" do
        album = Folder.create!(valid_attributes)
        get :index
        assigns(:albums).should eq([album])
        response.should be_success
      end
    end

    describe "GET 'new'" do
      it "should assign a new album as @album" do
        get :new
        assigns(:album).should be_a_new(Folder)
        response.should be_success
      end
    end

    describe "GET 'show'" do
      it "should assign a album as @album" do
        album = Folder.create!(valid_attributes)
        get :show, {id: album.id}
        assigns(:album).should eq(album)
        response.should be_success
      end
    end

    describe "POST create" do
      
      describe "with valid params" do
        it "creates a new album" do
          expect {
            post :create, valid_params
          }.to change(Folder, :count).by(1)

          response.should redirect_to(albums_path)
        end
      end

      describe "without valid params" do
        it "creates a new album" do
          expect {
            post :create, invalid_params
          }.to change(Folder, :count).by(0)

          response.should render_template("new")
        end
      end

    end

  end

end
