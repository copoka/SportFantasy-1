require 'rails_helper'

RSpec.describe "ampluas/edit", :type => :view do
  before(:each) do
    @amplua = assign(:amplua, Amplua.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit amplua form" do
    render

    assert_select "form[action=?][method=?]", amplua_path(@amplua), "post" do

      assert_select "input#amplua_name[name=?]", "amplua[name]"
    end
  end
end
