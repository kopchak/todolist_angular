todoApp.controller 'SessionsController', ($scope, $auth) ->
  $scope.handleLoginBtnClick = ->
    $auth.submitLogin($scope.loginForm).then((resp) ->
      # handle success response
    ).catch (resp) ->
      # handle error response
