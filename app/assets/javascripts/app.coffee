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
        templateUrl: "players.html"
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