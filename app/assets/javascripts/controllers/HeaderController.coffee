controllers = angular.module('controllers')
controllers.controller("HeaderController", [ '$scope', '$location',
  ($scope, $location)->
    $scope.isAlive = (viewLocation) ->
      viewLocation == $location.path
])