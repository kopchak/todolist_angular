todoApp.controller 'ProjectsController', [
  '$scope'
  '$http'
  'projectFactory'
  ($scope, $http, projectFactory) ->
    $scope.projectData = {}
    $scope.showMe = false

    getProjects = ->
      projectFactory.getProjects().success (data) ->
        $scope.projects = data

    $scope.createProject = ->
      projectFactory.addProject($scope.projectData).success (data) ->
        $scope.projects.push(data.project)
        $scope.projectData = {}

    $scope.updateProject = (project) ->
      projectFactory.updateProject(project)

    $scope.deleteProject = (project) ->
      $(event.target).parents('.project').remove()
      projectFactory.deleteProject(project)

    $scope.toggleProject = ->
      $scope.showMe = !$scope.showMe

    getProjects()
]
