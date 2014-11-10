controllers = angular.module('controllers')
controllers.controller("PlayersController", [ '$scope', '$routeParams', '$location', '$resource', '$http',
  ($scope, $routeParams, $location, $resource, $http)->
#    module.factory('User', ($resource)->
#      $resource('/users/:id'))
    Player = $resource('/players/:playerId', { playerId: "@id", format: 'json' })
    $scope.players = Player.query()

    User = $resource('/users/:userId', { userId: "@id", format: 'json' })
#    $scope.current_user = User.query()[0]
    $scope.current_user = null
    $scope.$apply 'current_user'
    $scope.users = User.query()


    #    $scope.add_player_to_user_team = (player_id, user_team_id)->
    #      $location.path("/user_team/add_player_to_user_team")

    $scope.add_player_to_user_team = (player_id, user_team_id)->
#      $location.path '/'
      $http.post('/user_team/add_player_to_user_team', {player_id: player_id, user_team_id: user_team_id}).
      success((data, status, headers, config) ->
        $location.path '/'
      ).
      error((data, status, headers, config) ->
#
      )

])