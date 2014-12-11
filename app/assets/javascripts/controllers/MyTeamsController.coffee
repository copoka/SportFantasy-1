controllers = angular.module('controllers')
controllers.controller("MyTeamsController", [ '$scope', '$routeParams', '$location',
                                              '$resource', '$http', 'User', 'SharedData', 'UserTeam',
  ($scope, $routeParams, $location, $resource, $http, User, SharedData, UserTeam)->
    $scope.positionings=[
      '4-4-2',
      '4-5-1',
      '3-4-3'
    ]
    $scope.current_positioning=$scope.positionings[0]
])
