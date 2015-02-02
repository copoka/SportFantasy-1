$ ->
  for el in $('.player-in-list')
    $(el).draggable()
  make_football_field()

selector_name = '.players-in-line-'

make_football_field = ()->
  for players_count in [1..4]
    make_line players_count

make_line=(players_count)->
  $("#{selector_name}#{players_count} > div").each (i,el)->
    $(el).addClass "col-md-#{12/players_count}"

make_line_1 = ()->
  $("#{selector_name}1 > div").each (el)->
    el.addClass 'col-md-12'

make_line_2 = ()->
  $("#{selector_name}2 > div").each (el)->
    $(el).addClass 'col-md-6'

make_line_3 = ()->
  $("#{selector_name}3 > div").each (el)->
    el.addClass 'col-md-4'

make_line_4 = ()->
  $("#{selector_name}4 > div").each (el)->
    el.addClass 'col-md-3'

#TODO do it
make_line_5 = ()->
  $(selector_name + 5).each (el)->
    el.addClass 'col-md-12'
