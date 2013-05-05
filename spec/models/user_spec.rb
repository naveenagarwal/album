require 'spec_helper'

describe User do
  before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it { should have_many(:folders) }
end
