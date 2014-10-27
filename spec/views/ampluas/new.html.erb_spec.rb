require 'rails_helper'

RSpec.describe "ampluas/new", :type => :view do
  before(:each) do
    assign(:amplua, Amplua.new(
      :name => "MyString"
    ))
  end

  it "renders new amplua form" do
    render

    assert_select "form[action=?][method=?]", ampluas_path, "post" do

      assert_select "input#amplua_name[name=?]", "amplua[name]"
    end
  end
end
