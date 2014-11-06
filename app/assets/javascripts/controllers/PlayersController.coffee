controllers = angular.module('controllers')
controllers.controller("PlayersController", [ '$scope', '$routeParams', '$location', '$resource',
  ($scope, $routeParams, $location, $resource)->
#    module.factory('User', ($resource)->
#      $resource('/users/:id'))
    Player = $resource('/players/:playerId', { playerId: "@id", format: 'json' })
    $scope.players = Player.query()
])