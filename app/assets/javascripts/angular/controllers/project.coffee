todoApp.controller 'ProjectsController', [
  '$scope'
  'toastr'
  'projectFactory'
  ($scope, toastr, projectFactory) ->
    $scope.projectData = {}

    getProjects = ->
      projectFactory.getProjects().success (data) ->
        $scope.projects = data

    $scope.createProject = ->
      projectFactory.create($scope.projectData).success (data) ->
        $scope.projects.push(data.project)
        $scope.projectData = {}
        toastr.success('Todo list was created')

    $scope.updateProject = (project) ->
      project.title = $scope.projectData.title
      projectFactory.update(project).success (data) ->
        project.editProject = false
        $scope.projectData = {}
        toastr.success('Todo list was updated')

    $scope.deleteProject = (project, index) ->
      projectFactory.destroy(project).success (data) ->
        $scope.projects.splice(index, 1)
        toastr.warning('Todo list was deleted')

    $scope.showEditForm = (project) ->
      $scope.projectData.title = project.title
      project.editProject = !project.editProject

    getProjects()
]
