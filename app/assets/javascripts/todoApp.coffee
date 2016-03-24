window.todoApp = angular.module('TodoList', [
  'ui.router'
  'templates'
  'ngAnimate'
  'mgcrea.ngStrap'
])

todoApp.config [
  '$stateProvider'
  '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->
    $stateProvider
      .state('projects',
        url: '/projects'
        templateUrl: 'angular/templates/projects.html'
        controller: 'ProjectsController')
    $urlRouterProvider.otherwise 'projects'
    return
]
