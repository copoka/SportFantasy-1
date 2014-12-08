#ЭТОТ ПАРСЕР ТОЛЬКО ДЛЯ ЕДИНИЧНОГО ИСПОЛЬЗОВАНИЯ - ЗАБИТЬ ТАБЛИЦЫ ИНФОЙ О ТЕКУЩЕМ СЕЗОНЕ СЕЙЧАС
#ДЛЯ ПОСТОЯННОГО ОБНОВЛЕНИЯ ИНФЫ НАДО ПИСАТЬ ДРУГОЙ (НАПРИМЕР, ДЛЯ РАСЧЕТА for_playing_60_minutes_or_more)
require 'csv'

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
  Amplua.where(name: amplua_name).firs!
end

def parse_initial
  # populate ampluas
  Amplua.find_or_create_by! name: 'Вратарь'
  Amplua.find_or_create_by! name: 'Защитник'
  Amplua.find_or_create_by! name: 'Полузащитник'
  Amplua.find_or_create_by! name: 'Нападающий'

  # populate real teams
  CSV.foreach('stats_teams.csv') do |row|
    RealTeam.find_or_create_by! name: row[0]
  end

  CSV.foreach('stats.csv', headers: true) do |row|
    amplua_code = row['pos']
    amplua_code.slice!(0, 3)

    prep_amplua_id = get_amplua_id(amplua_code)

    # prep_for_playing_60_minutes_or_more = (row['MP'] / 60) - (row['MP'] % 60)
    # prep_for_playing_up_to_60_minutes = row['MP'] % 60

    real_team=RealTeam.where(name: row['team']).first!

    player = Player.create!(
        name: row['name'],
        apmlua_id: prep_amplua_id,
        real_team: real_team
    )

    TotalPerformance.create!(
        player_id: player.id,
        amplua_id: player.amplua_id,
        # for_playing_up_to_60_minutes: prep_for_playing_up_to_60_minutes,
        # for_playing_60_minutes_or_more: prep_for_playing_60_minutes_or_more,
        goals: row['GS'],
        assists: row['Ass'],
        three_saves_gk: row['Sav']/3, #откуда, как? стоит просто поставить сейвы и уже каждые 3 высчитывать на логике
        penalty_save_gk: row['PS'],
        penalty_miss: row['PM'],
        clean_sheet: row['CS'],
        # mvps:, #откуда, как? можно либо свой алгоритм сделать, либо искать официальный
        # every_two_goals_df_gk:, #не факт, что это нам надо, можно это в логике сделать(это только для информации если)
        yellow_cards: row['YC'],
        red_cards: row['RC'],
    # self_goals: #надо придумать, откуда взять
    #а вообще, давайте попробуем таблицу перфомансов подогнать под данные, которые мы имеем, это имело бы смысл
    #
    #короче, жду предложения в коментарии
    )
  end
end