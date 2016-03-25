window.todoApp = angular.module('TodoList', [
  'templates'
  'ngAnimate'
  'ui.router'
  'ui.sortable'
  'ui.bootstrap'
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
