sport_fantasyServices = angular.module('sport_fantasyServices', ['ngResource'])
sport_fantasyServices.factory('User', ['$resource',
  ($resource)->
    $resource('/users/:userId', {userId: "@id", format: 'json'})
])

sport_fantasyServices.factory('UserTeamPlayer', ['$resource',
  ($resource)->
    $resource('/user_team_players/:user_team_player_Id.json'
    , {user_team_player_Id: "@id"}
    , {update: {method: 'PUT'}})
])

sport_fantasyServices.factory('UserTeam', #['$location', '$resource', '$http', '$scope',
  ($location, $resource, $http)->
    UserTeam = $resource('/user_teams/:user_team_Id.json', {user_team_Id: "@id"})
    #UserTeam.prototype.user_team_players = {}
    #TODO удалить этот метод, либо перенести два метода из PlayersController
    UserTeam.prototype.add_player = (player)->
      #alert "before post" + this.user_team_players
      $http.post('/user_team/add_player_to_user_team.json', {player_id: player.id, id: this.id})
    #.success (response)->
    #alert "this " + this.gfdfgdf
    # alert "before " + this.user_team_players
    #alert "name " + this.name
    #alert "id " + this.id
    #this.user_team_players.push response.data
    #,
    #(err)->
    #  alert err.data
    UserTeam
)

sport_fantasyServices.factory('SharedData',
()->
  Data: {current_user: ''}
)
