todoApp.controller 'ProjectsController', [
  '$scope'
  'projectFactory'
  ($scope, projectFactory) ->
    $scope.projectData = {}

    getProjects = ->
      projectFactory.getProjects().success (data) ->
        $scope.projects = data

    $scope.createProject = ->
      projectFactory.create($scope.projectData).success (data) ->
        $scope.projects.push(data.project)
        $scope.projectData = {}

    $scope.updateProject = (project) ->
      project.title = $scope.projectData.title
      projectFactory.update(project).success (data) ->
        project.editProject = false
        $scope.projectData = {}

    $scope.deleteProject = (project, index) ->
      projectFactory.destroy(project).success (data) ->
        $scope.projects.splice(index, 1)

    $scope.showEditForm = (project) ->
      $scope.projectData.title = project.title
      project.editProject = !project.editProject

    getProjects()
]
