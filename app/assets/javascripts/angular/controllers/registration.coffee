todoApp.controller 'RegistrationsController', [
  '$scope'
  'toastr'
  '$state'
  '$auth'
  ($scope, $state, $auth, toastr) ->
    $scope.$on 'auth:registration-email-success', (ev, message) ->
      # toastr.success 'Welcome aboard!'

    $scope.$on 'auth:oauth-registration', (ev, message) ->
      $state.go 'projects'
      # toastr.success 'Successfully authenticated from Facebook account.'

    $scope.handleRegBtnClick = ->
      $auth.submitRegistration($scope.registrationForm).then( (resp) ->
        $auth.submitLogin
          email: $scope.registrationForm.email
          password: $scope.registrationForm.password
        $state.go 'projects'
        # handle success response
      ).catch (resp) ->
        # handle error response

    # $scope.handleBtnClick = ->
    #   $auth.authenticate('facebook').then((resp) ->
    #     console.log resp
    #     # handle success
    #   ).catch (resp) ->
    #     # handle errors

    $scope.goLogin = ->
      $state.go 'sign_in'
]
