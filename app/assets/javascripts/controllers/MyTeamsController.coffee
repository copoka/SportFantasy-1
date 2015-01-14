controllers = angular.module('controllers')
controllers.controller("MyTeamsController", [ '$scope', '$routeParams', '$location',
                                              '$resource', '$http', 'User', 'SharedData', 'UserTeam', 'UserTeamPlayer',
  ($scope, $routeParams, $location, $resource, $http, User, SharedData, UserTeam, UserTeamPlayer)->
    $scope.positionings = [
      '4-4-2',
      '4-5-1',
      '3-4-3'
    ]
    $scope.players = [
      {name: 'player1', amplua: 'GOL', img_url: 'assets/Benzema.jpg'},
      {name: 'player2', amplua: 'GOL', img_url: 'assets/Di_Maria.jpg'},
      {name: 'player3', amplua: 'DEF', img_url: 'assets/Diego_Costa.jpg'},
      {name: 'player4', amplua: 'DEF', img_url: 'assets/Ibrahimovic.jpg'},
      {name: 'player5', amplua: 'DEF', img_url: 'assets/Ronaldo.jpg'},
      {name: 'player6', amplua: 'DEF', img_url: 'assets/Rooney.jpg'},
      {name: 'player7', amplua: 'MID', img_url: '#'},
      {name: 'player8', amplua: 'MID', img_url: '#'},
      {name: 'player9', amplua: 'MID', img_url: '#'},
      {name: 'player10', amplua: 'MID', img_url: '#'},
      {name: 'player11', amplua: 'MID', img_url: '#'},
      {name: 'player12', amplua: 'FRW', img_url: '#'},
      {name: 'player13', amplua: 'FRW', img_url: '#'},
      {name: 'player14', amplua: 'FRW', img_url: '#'},
    ]
    $scope.current_positioning = $scope.positionings[0]

    $scope.SharedData = SharedData
    UserTeam.query {user_id: $scope.SharedData.current_user.id}, (resp)->
      $scope.my_team = resp[0]
      UserTeamPlayer.query {user_team_id: $scope.my_team.id}, (resp)->
        $scope.my_team.user_team_players = resp

    $scope.user_team_player_change_first_team = (user_team_player)->
      user_team_player.first_team=!user_team_player.first_team
      user_team_player.$update()# PUT
      .then (response)->
        console.log(JSON.stringify(response))
        user_team_player.first_team = response.first_team
      ,
      (err)->
        alert err.data
        user_team_player.first_team=!user_team_player.first_team

#      UserTeamPlayer.get({user_team_player_Id: user_team_player.id}, (current_user_team_player)->
#        current_user_team_player.first_team = !user_team_player.first_team
#        current_user_team_player.$update()# PUT
#        .then (response)->
#          console.log(JSON.stringify(response))
#          user_team_player.first_team = response.first_team
#        ,
#        (err)->
#          alert err.data
#      )

])
