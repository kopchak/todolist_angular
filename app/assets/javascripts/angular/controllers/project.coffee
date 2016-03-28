todoApp.controller 'ProjectsController', [
  '$scope'
  '$http'
  'projectFactory'
  ($scope, $http, projectFactory) ->
    $scope.projectData = {}

    getProjects = ->
      projectFactory.getProjects().success (data) ->
        $scope.projects = data

    $scope.createProject = ->
      projectFactory.addProject($scope.projectData).success (data) ->
        $scope.projects.push(data.project)
        $scope.projectData = {}

    $scope.updateProject = (project, projectData) ->
      project.title = projectData.title
      projectFactory.updateProject(project)
      project.editProject = !project.editProject
      $scope.projectData = {}

    $scope.deleteProject = (project, index) ->
      $scope.projects.splice(index, 1)
      projectFactory.deleteProject(project)

    $scope.showEditForm = (project) ->
      $scope.projectData.title = project.title
      project.editProject = !project.editProject

    getProjects()
]
