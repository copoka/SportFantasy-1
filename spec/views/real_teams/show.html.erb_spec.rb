require 'rails_helper'

RSpec.describe "real_teams/show", :type => :view do
  before(:each) do
    @real_team = assign(:real_team, RealTeam.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
