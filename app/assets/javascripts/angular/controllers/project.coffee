todoApp.controller 'ProjectsController', [
  '$scope'
  'toastr'
  'Restangular'
  ($scope, toastr, Restangular) ->
    $scope.projectData = {}
    window.location.href = '/#/projects'

    getProjects = ->
      Restangular.all('projects').getList().then (projects) ->
        $scope.projects = projects

    $scope.createProject = ->
      Restangular.all('projects').post($scope.projectData).then (data) ->
        $scope.projects.push(data.project)
        $scope.projectData = {}
        toastr.success(I18n.t('toastr.project.create'))

    $scope.updateProject = (project) ->
      project.title = $scope.projectData.title
      Restangular.one("projects", project.id).put($scope.projectData).then (data) ->
        project.editProject = false
        $scope.projectData = {}
        toastr.success(I18n.t('toastr.project.update'))

    $scope.deleteProject = (project, index) ->
      Restangular.one("projects", project.id).remove().then ->
        $scope.projects.splice(index, 1)
        toastr.warning(I18n.t('toastr.project.delete'))

    $scope.showEditForm = (project) ->
      $scope.projectData.title = project.title
      project.editProject = !project.editProject

    getProjects()
]
