sport_fantasy = angular.module('sport_fantasy', [
  'templates',
  'ngRoute',
#  'ngResource',
  'controllers',
#  'angular-flash.service',
#  'angular-flash.flash-alert-directive'
])

sport_fantasy.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
    .when('/players',
        templateUrl: "index.html"
        controller: 'VoidController'
      )
    .when('/',
        templateUrl: "index.html"
        controller: 'VoidController'
      )
])

controllers = angular.module('controllers', [])
controllers.controller("VoidController", [ '$scope',
  ($scope)->
])