controllers = angular.module('controllers')
controllers.controller("MyTeamsController", [ '$scope', '$routeParams', '$location',
                                              '$resource', '$http', 'User', 'SharedData', 'UserTeam',
  ($scope, $routeParams, $location, $resource, $http, User, SharedData, UserTeam)->
    $scope.positionings=[
      '4-4-2',
      '4-5-1',
      '3-4-3'
    ]
    $scope.players=[
      {name: 'player1', amplua: 'GOL'},
      {name: 'player2', amplua: 'GOL'},
      {name: 'player3', amplua: 'DEF'},
      {name: 'player4', amplua: 'DEF'},
      {name: 'player5', amplua: 'DEF'},
      {name: 'player6', amplua: 'DEF'},
      {name: 'player7', amplua: 'MID'},
      {name: 'player8', amplua: 'MID'},
      {name: 'player9', amplua: 'MID'},
      {name: 'player10', amplua: 'MID'},
      {name: 'player11', amplua: 'MID'},
      {name: 'player12', amplua: 'FRW'},
      {name: 'player13', amplua: 'FRW'},
      {name: 'player14', amplua: 'FRW'},
    ]
    $scope.current_positioning=$scope.positionings[0]
])
