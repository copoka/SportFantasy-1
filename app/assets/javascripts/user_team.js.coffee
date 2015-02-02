$ ->
  for el in $('.player-in-list')
    $(el).draggable()
  make_football_field()

selector_name = '.players-in-line-'

make_football_field = ()->
  for players_count in [1..5]
    make_line players_count

# players_count in [1..5] range
make_line=(players_count)->
  $("#{selector_name}#{players_count} > div").each (i,el)->
    if players_count!=5
      $(el).addClass "col-md-#{12/players_count}"
    else
      if i==0
        $(el).addClass 'col-md-offset-1'
      $(el).addClass 'col-md-2'