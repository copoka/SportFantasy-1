sport_fantasy = angular.module('sport_fantasy', [
  'templates',
  'ngRoute',
  'ngResource',
  'Devise',
  'controllers',
  'sport_fantasyServices',
#  'directives'
#  'directives'
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
    .when('/my_teams',
      templateUrl: "my_teams.html"
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
    $scope.number = 4
    $scope.getNumber = (num)->
      console.log("num "+num)
      new Array(num)
    $scope.col_class = "col-md-3"

    i=-1
    $scope.getColumnClass = (width)->
      console.log("width "+width)
      # e.g. 5 players in line
      if(width != 2)
        return "col-md-" + width.toString()
      else
        i+=1
        if(i==0)
          return 'col-md-2 col-md-offset-1'
        if(i==4) then i=-1
        'col-md-2'
])