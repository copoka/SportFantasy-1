require 'rails_helper'

RSpec.describe "ampluas/show", :type => :view do
  before(:each) do
    @amplua = assign(:amplua, Amplua.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
