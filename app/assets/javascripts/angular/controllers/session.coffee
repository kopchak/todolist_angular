todoApp.controller 'SessionsController', [
  '$scope'
  'toastr'
  '$state'
  '$auth'
  ($scope, toastr, $state, $auth) ->
    $scope.$on 'auth:oauth-registration', (ev, message) ->
      $state.go 'projects'
      toastr.success('Sign in from Facebook account successfully completed')

    $scope.handleLoginBtnClick = ->
      $auth.submitLogin($scope.loginForm).then((resp) ->
        $state.go 'projects'
        toastr.success('Signed in successful')
      ).catch (resp) ->
        toastr.error('Please fill in the fields correctly')

    $scope.handleSignOutBtnClick = ->
      $auth.signOut().then((resp) ->
        $state.go('sign_in')
        toastr.success('Bye!')
      ).catch (resp) ->
        toastr.error('Something wet wrong')

    $scope.goRegistration = ->
      $state.go('sign_up')

]
