controllers = angular.module('controllers')
controllers.controller("PlayersController", [ '$scope', '$routeParams', '$location',
                                              '$resource', '$http', 'User', 'SharedData', 'UserTeam',
  ($scope, $routeParams, $location, $resource, $http, User, SharedData, UserTeam)->
#    module.factory('User', ($resource)->
#      $resource('/users/:id'))
    Player = $resource('/players/:playerId', { playerId: "@id", format: 'json' })
    $scope.players = Player.query()

    #    User = $resource('/users/:userId', { userId: "@id", format: 'json' })
    #    UserTeam = $resource('/user_teams/:user_team_Id.json', {user_team_Id: "@id"})
    UserTeamPlayer = $resource('/user_team_players/:user_team_player_Id.json', {user_team_player_Id: "@id"})

    #    $scope.players = Player.query()
    #    $scope.user_teams = UserTeam.query {user_id: 3}

    #    $scope.current_user = User.query()[0]
    #    $scope.current_user = null
    #    $scope.$apply 'current_user'
    $scope.SharedData = SharedData
    $scope.users = User.query '', (resp)->
      $scope.SharedData.current_user = resp[0]


    #    $scope.$watch 'current_user', ->
    #      UserTeam.query {user_id: $scope.current_user.id}
    #      , (resp)->
    #        $scope.user_teams = resp
    $scope.$watch 'SharedData.current_user', ->
      $scope.SharedData.current_user.user_teams = UserTeam.query {user_id: $scope.SharedData.current_user.id}

    #    $scope.$watch 'current_team', ->
    #      $scope.user_team_players = UserTeamPlayer.query {user_team_id: $scope.current_team.id}

    $scope.$watch 'current_team', ->
      $scope.user_team_players = UserTeamPlayer.query {user_team_id: $scope.current_team.id}

    #      , (err)->
    #err handle

    $scope.add_player_to_user_team = (player)->
      $scope.current_team.add_player(player)
      .then (response)->
#          alert response.data.toString()
#          alert response.data.user_team.name
#          $scope.user_team_players = UserTeamPlayer.query {user_team_id: $scope.current_team.id}
#          $scope.user_team_players << {player: player}
          $scope.$apply ()->
#            alert player.toJson
            $scope.user_team_players << {player: player.toJson}
        , (err)->
          alert err.data

#    $scope.add_player_to_user_team = (player_id, user_team_id)->
#      $http.post('/user_team/add_player_to_user_team', {player_id: player_id, user_team_id: user_team_id}).
#      success((data, status, headers, config) ->
#        $location.path '/'
#      ).
#      error((data, status, headers, config) ->
##
#      )

])