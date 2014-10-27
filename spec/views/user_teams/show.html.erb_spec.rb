require 'rails_helper'

RSpec.describe "user_teams/show", :type => :view do
  before(:each) do
    @user_team = assign(:user_team, UserTeam.create!(
      :user => "",
      :name => "Name",
      :score => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
  end
end
