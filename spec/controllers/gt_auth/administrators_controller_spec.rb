require 'spec_helper'

module GtAuth
  describe AdministratorsController do

    describe 'POST create' do

      context 'given valid attributes' do

        let(:attrs) {{ 'name' => 'jack', 'password' => 'secret', 'password_confirmation' => 'secret' }}
        let(:administrator) { stub('administrator', as_json: attrs) }

        before do
          Administrator.stub(:new).with(attrs).and_return(administrator)
          administrator.stub(:save).and_return(true)
        end

        it "renders the Administrator as json" do
          post :create, administrator: attrs, use_route: :gt_auth
          response.body.should == attrs.to_json
        end
      end

      context 'given mismatching passwords' do

        let(:attrs) {{ 'name' => 'jack', 'password' => 'secret', 'password_confirmation' => 'wrong' }}
        let(:invalid_admin) { stub('invalid admin') }

        before do
          Administrator.stub(:new).with(attrs).and_return(invalid_admin)
          invalid_admin.stub(:save).and_return(false)
        end

        it "renders an error in json format" do
          post :create, administrator: attrs, use_route: :gt_auth
          response.body.should == %Q({"error":"Invalid attributes"})
        end
      end
    end
  end
end
