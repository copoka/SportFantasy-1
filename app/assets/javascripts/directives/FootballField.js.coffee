sport_fantasy = angular.module('sport_fantasy')
sport_fantasy.directive "footballField", ()->
  restrict: "E"
  scope:
    positioning: '@'
#  @ reads the attribute value, = provides two-way binding, & works with functions
  template: "<div>footballField {{positioning}} {{col_width}}</div>"

  link: (scope, element, attr)->
    scope.col_width = scope.positioning+"fgdfgdf"