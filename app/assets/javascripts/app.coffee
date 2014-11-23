sport_fantasy = angular.module('sport_fantasy', [
  'templates',
  'ngRoute',
  'ngResource',
  'Devise',
  'controllers',
  'sport_fantasyServices'
#  'sport_fantasy2',
#  'angular-flash.service',
#  'angular-flash.flash-alert-directive'
])

#sport_fantasy2 = angular.module('sport_fantasy2', ['Devise']).
#config((AuthProvider)->
## Configure Auth service with AuthProvider
#).
#controller('myCtrl', (Auth)->
## Use your configured Auth service.
#)

sport_fantasy.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
    .when('/players',
#      templateUrl: JST["players"]
#      templateUrl: "players"
      templateUrl: "players.html"
#      templateUrl: "index2.html"
#        templateUrl: "app/views/players/index.html.haml"
      controller: 'PlayersController'
    )
    .when('/',
      templateUrl: "index2.html"
      controller: 'VoidController'
    )
])

#sport_fantasy.config((AuthProvider)->
#  AuthProvider.registerPath('/users/sign_in.json');
#  AuthProvider.registerMethod('GET');
#  AuthProvider.resourceName('user');
#)

controllers = angular.module('controllers', [])
controllers.controller("VoidController", [ '$scope',
  ($scope)->
])