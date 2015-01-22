#lib/tasks/import.rake
#ЭТОТ ПАРСЕР ТОЛЬКО ДЛЯ ЕДИНИЧНОГО ИСПОЛЬЗОВАНИЯ - ЗАБИТЬ ТАБЛИЦЫ ИНФОЙ О ТЕКУЩЕМ СЕЗОНЕ СЕЙЧАС
#ДЛЯ ПОСТОЯННОГО ОБНОВЛЕНИЯ ИНФЫ НАДО ПИСАТЬ ДРУГОЙ (НАПРИМЕР, ДЛЯ РАСЧЕТА for_playing_60_minutes_or_more)

require 'csv'

#TODO check this method, because player created without amplua
def get_amplua_id(amplua_code)
  amplua_name=case amplua_code
                when "FOR"
                  'Нападающий'
                when "MID"
                  'Полузащитник'
                when "DEF"
                  'Защитник'
                when "GK"
                  'Вратарь'
              end
  Amplua.where(name: amplua_name).first!
end

desc "Imports a CSV files into an DB"
task :populate_DB_from_CSV_files => :environment do

  # populate ampluas
  Amplua.find_or_create_by! name: 'Вратарь'
  Amplua.find_or_create_by! name: 'Защитник'
  Amplua.find_or_create_by! name: 'Полузащитник'
  Amplua.find_or_create_by! name: 'Нападающий'

  puts     File.dirname(__FILE__)
  # populate real teams
  CSV.foreach("#{File.dirname(__FILE__)}/../parser/stats_team.csv") do |row|
    RealTeam.find_or_create_by! name: row[0]
  end

  CSV.foreach("#{File.dirname(__FILE__)}/../parser/stats.csv", headers: true) do |row|
    amplua_code = row['pos']
    amplua_code.slice!(0, 3)

    prep_amplua_id = get_amplua_id(amplua_code)

    # prep_for_playing_60_minutes_or_more = (row['MP'] / 60) - (row['MP'] % 60)
    # prep_for_playing_up_to_60_minutes = row['MP'] % 60

    real_team=RealTeam.where(name: row['team']).first!

    player = Player.find_or_create_by!(name: row['name']) do |player|
      player.amplua_id= prep_amplua_id
      player.real_team= real_team
    end

    TotalPerformance.find_or_create_by!(player_id: player.id) do |tp|
      # for_playing_up_to_60_minutes= prep_for_playing_up_to_60_minutes
      # for_playing_60_minutes_or_more= prep_for_playing_60_minutes_or_more
      tp.goals= row['GS']
      tp.assists= row['Ass']
      tp.three_saves_gk= row['Sav'].to_i / 3 #откуда  как? стоит просто поставить сейвы и уже каждые 3 высчитывать на логике
      tp.penalty_save_gk= row['PS']
      tp.penalty_miss= row['PM']
      tp.clean_sheet= row['CS']
      # mvps=  #откуда  как? можно либо свой алгоритм сделать  либо искать официальный
      # every_two_goals_df_gk=  #не факт  что это нам надо  можно это в логике сделать(это только для информации если)
      tp.yellow_cards= row['YC']
      tp.red_cards= row['RC']
      # self_goals: #надо придумать, откуда взять
    end
  end
end
