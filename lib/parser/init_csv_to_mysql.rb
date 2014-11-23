#ЭТОТ ПАРСЕР ТОЛЬКО ДЛЯ ЕДИНИЧНОГО ИСПОЛЬЗОВАНИЯ - ЗАБИТЬ ТАБЛИЦЫ ИНФОЙ О ТЕКУЩЕМ СЕЗОНЕ СЕЙЧАС
#ДЛЯ ПОСТОЯННОГО ОБНОВЛЕНИЯ ИНФЫ НАДО ПИСАТЬ ДРУГОЙ (НАПРИМЕР, ДЛЯ РАСЧЕТА for_playing_60_minutes_or_more)
require 'csv'

CSV.foreach(stats.csv, headers: true) do |row|
  amplua_code = row[1]
  amplua_code.slice!(0, 3)

  case amplua_code
  when "FOR"
    prep_amplua_id = 4
  when "MID"
    prep_amplua_id = 3
  when "DEF"
    prep_amplua_id = 2
  when "GK"
    prep_amplua_id = 1
  end

  prep_for_playing_60_minutes_or_more = (row[2] / 60) - (row[2] mod 60)
  prep_for_playing_up_to_60_minutes = row[2] mod 60

  player = Player.new (
    name: row[0],
    apmlua_id: prep_amplua_id,
    real_team_id: row[18]
  )
  player.save

  player.perfomance.new (
    player_id: player.id,
    amplua_id: player.amplua_id,
    for_playing_up_to_60_minutes: prep_for_playing_up_to_60_minutes,
    for_playing_60_minutes_or_more: prep_for_playing_60_minutes_or_more,
    goals: row[4],
    assists: row[5],
    three_saves_gk: row[14],#row[14] / 3                                        #откуда, как? стоит просто поставить сейвы и уже каждые 3 высчитывать на логике
    penalty_save_gk: row[11],
    penalty_miss: ,
    clean_sheet: row[6],
    mvps: ,                                                                     #откуда, как? можно либо свой алгоритм сделать, либо искать официальный
    every_two_goals_df_gk: ,                                                    #не факт, что это нам надо, можно это в логике сделать(это только для информации если)
    yellow_cards: row[12],
    red_cards: row[13],
    self_goals:                                                                 #надо придумать, откуда взять
                                                                                #а вообще, давайте попробуем таблицу перфомансов подогнать под данные, которые мы имеем, это имело бы смысл
                                                                                #
                                                                                #короче, жду предложения в коментарии
  )
  player.perfomance.save
  end
end
