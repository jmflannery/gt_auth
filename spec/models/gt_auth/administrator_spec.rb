require 'spec_helper'

module GtAuth
  describe Administrator do

    let(:attrs) {{ name: 'jack', password: 'secret', password_confirmation: 'secret' }}
    subject { Administrator.new(attrs) }

    it { should respond_to :name }
    it { should respond_to :password }
    it { should respond_to :password_confirmation }
    it { should respond_to :remember_token }

    describe 'remember_token' do

      before { subject.save }
      its(:remember_token) { should_not be_blank }
    end

    describe '#as_json' do

      before (:each) { subject.save }

      it "has the correct json" do
        subject.as_json.should == attrs
      end
    end
  end
end
