controllers = angular.module('controllers')
controllers.controller("HeaderController", [ '$scope', '$location', '$resource','SharedData'
  ($scope, $location, $resource,SharedData)->
    $scope.isAlive = (viewLocation) ->
      viewLocation == $location.path

#    User = $resource('/users/:userId', { userId: "@id", format: 'json' })
#    $scope.all_users = User.query()
#    $scope.current_user = $scope.all_users[0]
#    $scope.users = User.query()
    $scope.SharedData=SharedData
])