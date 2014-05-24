require 'spec_helper'

describe InvoicesController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'synchronize'" do
    it "returns http success" do
      get 'synchronize'
      response.should be_success
    end
  end

end
