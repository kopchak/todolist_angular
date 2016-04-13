todoApp.controller 'RegistrationsController', [
  '$scope'
  '$state'
  '$auth'
  'toastr'
  ($scope, $state, $auth, toastr) ->
    $scope.$on 'auth:oauth-registration', (ev, message) ->
      toastr.success(I18n.t('toastr.sign_up.fb_login'))

    $scope.handleRegBtnClick = ->
      $auth.submitRegistration($scope.registrationForm).then( (resp) ->
        $auth.submitLogin
          email: $scope.registrationForm.email
          password: $scope.registrationForm.password
        $state.go 'projects'
        toastr.success(I18n.t('toastr.sign_up.greeting'), I18n.t('toastr.sign_up.success'))
      ).catch (resp) ->
        toastr.error(resp.errors[0])

    $scope.goLogin = ->
      $state.go 'sign_in'
]
