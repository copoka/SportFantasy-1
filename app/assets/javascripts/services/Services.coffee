sport_fantasyServices = angular.module('sport_fantasyServices', ['ngResource'])
sport_fantasyServices.factory('User', ['$resource',
  ($resource)->
    $resource('/users/:userId', {userId: "@id", format: 'json'})
])

sport_fantasyServices.factory('SharedData',
()->
  Data: {current_user: ''}
)
