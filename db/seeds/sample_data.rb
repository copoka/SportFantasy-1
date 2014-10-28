require 'factory_girl'
#require 'spec/factories/real_teams'

#Amplua.create name: 'Вратарь'
#Amplua.create name: 'Защитник'
#Amplua.create name: 'Полузащитник'
#Amplua.create name: 'Нападающий'

FactoryGirl.create_list(:real_team_with_players, 10)

#10.times do
#  FactoryGirl.create(:player)
#end



