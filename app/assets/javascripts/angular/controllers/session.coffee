todoApp.controller 'SessionsController', [
  '$scope'
  '$state'
  '$auth'
  ($scope, $state, $auth) ->
    $scope.$on 'auth:login-success', (ev, user) ->
      $state.go('projects')

    $scope.$on 'auth:logout-success', (ev) ->
      $state.go('sign_in')

    $scope.handleSignOutBtnClick = ->
      $auth.signOut()

]