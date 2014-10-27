require 'rails_helper'

RSpec.describe "players/edit", :type => :view do
  before(:each) do
    @player = assign(:player, Player.create!(
      :name => "MyString",
      :real_team => "",
      :amplua => "",
      :price => 1.5,
      :score => 1
    ))
  end

  it "renders the edit player form" do
    render

    assert_select "form[action=?][method=?]", player_path(@player), "post" do

      assert_select "input#player_name[name=?]", "player[name]"

      assert_select "input#player_real_team[name=?]", "player[real_team]"

      assert_select "input#player_amplua[name=?]", "player[amplua]"

      assert_select "input#player_price[name=?]", "player[price]"

      assert_select "input#player_score[name=?]", "player[score]"
    end
  end
end
