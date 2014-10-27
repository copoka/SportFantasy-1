require 'rails_helper'

RSpec.describe "ampluas/index", :type => :view do
  before(:each) do
    assign(:ampluas, [
      Amplua.create!(
        :name => "Name"
      ),
      Amplua.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of ampluas" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
