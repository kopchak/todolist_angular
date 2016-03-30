todoApp.controller 'RegistrationsController', [
  '$scope'
  '$state'
  '$auth'
  'toastr'
  ($scope, $state, $auth, toastr) ->
    $scope.$on 'auth:oauth-registration', (ev, message) ->
      $state.go 'projects'
      toastr.success('Sign in from Facebook account successfully completed')

    $scope.handleRegBtnClick = ->
      $auth.submitRegistration($scope.registrationForm).then( (resp) ->
        $auth.submitLogin
          email: $scope.registrationForm.email
          password: $scope.registrationForm.password
        $state.go 'projects'
        toastr.success('Welcome!', 'Registration success')
      ).catch (resp) ->
        toastr.error('Please fill in the fields correctly')

    $scope.goLogin = ->
      $state.go 'sign_in'
]
