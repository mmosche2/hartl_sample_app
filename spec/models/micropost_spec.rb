require 'spec_helper'

describe Micropost do
  
	let(:user) { FactoryGirl.create(:user) }
	before { @micropost = user.microposts.build(content: "Lorem ipsum") }

	subject { @micropost }

	it { should respond_to(:content) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
	its(:user) { should == user }

	it { should be_valid }

	describe "when user_id is not present" do
		before { @micropost.user_id = nil }
		it { should_not be_valid }
	end

	describe "accessible attributes" do
		it "should not allow mass-assignment of user_id" do
			expect do
				Micropost.new(user_id: user.id)
			end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end
	end

	describe "when content is nil" do
		before { @micropost.content = nil }
		it { should_not be_valid }
	end	
	
	describe "when content is blank" do
		before { @micropost.content = " " }
		it { should_not be_valid }
	end	

	describe "when content is greater than 140 characters" do
		before { @micropost.content = 'a' * 141 }
		it { should_not be_valid }
	end
end
