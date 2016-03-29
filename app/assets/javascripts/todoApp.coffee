window.todoApp = angular.module('TodoList', [
  'templates'
  'ngAnimate'
  'ui.router'
  'ui.sortable'
  'ui.bootstrap'
  'ngFileUpload'
  'ng-token-auth'
])

todoApp.config [
  '$stateProvider'
  '$urlRouterProvider'
  '$authProvider'
  ($stateProvider, $urlRouterProvider, $authProvider) ->
    $stateProvider
      .state('projects',
        url: '/projects'
        templateUrl: 'angular/templates/projects.html'
        controller: 'ProjectsController')
      .state('sign_in',
        url: '/sign_in'
        templateUrl: 'angular/templates/sign_in.html'
        controller: 'SessionsController')
      .state('sign_up',
        url: '/sign_up'
        templateUrl: 'angular/templates/sign_up.html'
        controller: 'RegistrationsController')
    $urlRouterProvider.otherwise 'sign_in'
    $authProvider.configure apiUrl: ''
]
