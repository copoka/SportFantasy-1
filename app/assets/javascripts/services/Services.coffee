sport_fantasyServices = angular.module('sport_fantasyServices', ['ngResource'])
sport_fantasyServices.factory('User', ['$resource',
  ($resource)->
    $resource('/users/:userId', {userId: "@id", format: 'json'})
])

sport_fantasyServices.factory('UserTeam', #['$location', '$resource', '$http', '$scope',
  ($location, $resource, $http)->
    UserTeam = $resource('/user_teams/:user_team_Id.json', {user_team_Id: "@id"})
    UserTeam.prototype.add_player = (player)->
      $http.post('/user_team/add_player_to_user_team', {player_id: player.id, id: this.id})
#      success((data, status, headers, config) ->
#        alert(this.user_team_players[0].name)
#        this.user_team_players<<data
##      $location.path '/'
#      ).
#      error((data, status, headers, config) ->
##
#      )
    UserTeam
)

sport_fantasyServices.factory('SharedData',
()->
  Data: {current_user: ''}
)
