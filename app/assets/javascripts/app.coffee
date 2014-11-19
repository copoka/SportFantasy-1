sport_fantasy = angular.module('sport_fantasy', [
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
  'sport_fantasyServices'
#  'angular-flash.service',
#  'angular-flash.flash-alert-directive'
])

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

controllers = angular.module('controllers', [])
controllers.controller("VoidController", [ '$scope',
  ($scope)->
])