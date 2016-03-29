todoApp.controller 'RegistrationsController', ($scope, $auth) ->
  $scope.handleRegBtnClick = ->
    $auth.submitRegistration($scope.registrationForm).then((resp) ->
      # handle success response
    ).catch (resp) ->
      # handle error response
