require 'spec_helper'

module GtAuth
  describe AdministratorsController do

    describe 'POST create' do

      let(:attrs) {{ 'name' => 'jack', 'password' => 'secret', 'password_confirmation' => 'secret' }}
      let(:administrator) { stub('administrator', as_json: attrs) }

      it "creates and saves a profile" do
        Administrator.should_receive(:create).with(attrs).and_return(administrator)
        post :create, administrator: attrs, use_route: :gt_auth
      end

      it "renders the Administrator as json" do
        post :create, administrator: attrs, use_route: :gt_auth
        response.body.should == attrs.to_json
      end
    end

  end
end
