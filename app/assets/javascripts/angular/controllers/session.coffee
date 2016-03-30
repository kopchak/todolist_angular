todoApp.controller 'SessionsController', [
  '$scope'
  'toastr'
  '$state'
  '$auth'
  ($scope, toastr, $state, $auth) ->
    $scope.$on 'auth:login-success', (ev, user) ->
      $state.go 'projects'

    $scope.$on 'auth:oauth-registration', (ev, message) ->
      # handle success response

    $scope.handleLoginBtnClick = ->
      $auth.submitLogin($scope.loginForm).then((resp) ->
        toastr.success('Loged in success!')
      ).catch (resp) ->
        # handle error response

    $scope.handleSignOutBtnClick = ->
      $auth.signOut().then((resp) ->
        $state.go 'sign_in'
        toastr.success('Log out success!')
        # handle success response
      ).catch (resp) ->
        # handle error response

    $scope.goRegistration = ->
      $state.go 'sign_up'

]
