require 'spec_helper'

describe "MicropostPages" do

	subject { page }

	let(:user) { FactoryGirl.create(:user) }
	before { sign_in user }

	describe "create" do
		before { visit root_path }

		describe "with invalid info" do
			it "should not create a new micropost" do
  			expect { click_button "Post" }.not_to change(Micropost, :count)
  		end

  		describe "error messages" do
  			before { click_button "Post" }
  			it { should have_content('error') }
  		end
		end

		describe "with valid info" do
			before { fill_in 'micropost_content', with: "Lorem ipsum" }
			it "should create a micropost" do
				expect { click_button 'Post' }.to change(Micropost, :count).by(1)
			end
		end
	end

	describe "destroy" do
		before { FactoryGirl.create(:micropost, user: user) }

		describe "as the correct user of that post" do
			before { visit root_path } 

			it "should delete the post" do
				expect { click_link 'delete' }.to change(Micropost, :count).by(-1)
			end
		end
	end



end
