sport_fantasy = angular.module('sport_fantasy')
sport_fantasy.directive("footballField", ['$compile', ($compile)->
  restrict: "E"
  scope:
    positioning: '='
#  @ reads the attribute value, = provides two-way binding, & works with functions
  templateUrl: 'directives/_football_field.html'
  #TODO create own controller
  controller: 'VoidController'

  link: (scope, element, attr)->
    scope.$watch 'positioning', ()->
#      console.log 'positioning changed'
      scope.local_positioning = scope.positioning.split('-').map (n)->
        parseInt n
      scope.local_positioning.reverse()
      scope.col_width = scope.local_positioning.map (n)->
        parseInt 12 / n
#      element.html('')
#      $compile(element.contents())(scope)
#      link(scope, element, attr)
#      element.update

#    scope.col_width.push "10"
#    this
])