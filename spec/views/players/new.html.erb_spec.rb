require 'rails_helper'

RSpec.describe "players/new", :type => :view do
  before(:each) do
    assign(:player, Player.new(
      :name => "MyString",
      :real_team => "",
      :amplua => "",
      :price => 1.5,
      :score => 1
    ))
  end

  it "renders new player form" do
    render

    assert_select "form[action=?][method=?]", players_path, "post" do

      assert_select "input#player_name[name=?]", "player[name]"

      assert_select "input#player_real_team[name=?]", "player[real_team]"

      assert_select "input#player_amplua[name=?]", "player[amplua]"

      assert_select "input#player_price[name=?]", "player[price]"

      assert_select "input#player_score[name=?]", "player[score]"
    end
  end
end
