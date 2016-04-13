todoApp.controller 'SessionsController', [
  '$scope'
  'toastr'
  '$state'
  '$auth'
  ($scope, toastr, $state, $auth) ->
    $scope.$on 'auth:oauth-registration', (ev, message) ->
      toastr.success(I18n.t('toastr.sign_in.fb_login'))

    $scope.handleLoginBtnClick = ->
      $auth.submitLogin($scope.loginForm).then((resp) ->
        $state.go 'projects'
        toastr.success(I18n.t('toastr.sign_in.success'))
      ).catch (resp) ->
        toastr.error(resp.errors[0])

    $scope.handleSignOutBtnClick = ->
      $auth.signOut().then((resp) ->
        $state.go('sign_in')
        toastr.success(I18n.t('toastr.sign_in.parting'))
      ).catch (resp) ->
        toastr.error(resp.errors[0])

    $scope.goRegistration = ->
      $state.go('sign_up')

]
