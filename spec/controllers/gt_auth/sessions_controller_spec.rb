require 'spec_helper'

module GtAuth

  describe SessionsController do

    let(:attrs) {{ name: 'wanda', password: 'sykes!' }}

    subject { response }

    describe 'POST create' do

      let(:wanda) { stub('administrator', as_json: attrs, remember_token: 'fg3h4jd8ddyd6') } 
      context 'given an authentic name and password' do

        before do
          Administrator.stub(:find_by_name).with('wanda').and_return(wanda)
          wanda.stub!(:authenticate).with('sykes!').and_return(true)
        end

        it 'signs the administrator in' do
          controller.should_receive(:sign_in).with(wanda)
          post :create, session: attrs, use_route: 'gt_auth'
        end

        it 'sets the current_admin' do
          get :create, session: attrs, use_route: 'gt_auth'
          controller.current_admin.should == wanda
        end

        it 'renders the authenticated administrator as json' do
          controller.stub(:sign_in).with(wanda)
          get :create, session: attrs, use_route: 'gt_auth'
          subject.body.should == wanda.to_json
        end 
      end

      context 'given a non authentic name and password' do

        before do
          Administrator.stub(:find_by_name).with('wanda').and_return(wanda)
          wanda.stub!(:authenticate).with('sykes!').and_return(false)
        end

        it 'renders an error in json format' do
          get :create, session: attrs, use_route: 'gt_auth'
          subject.body.should == %Q({"error":"Incorrect name or password"})
        end
      end
    end
  end
end
