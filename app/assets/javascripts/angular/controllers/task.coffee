todoApp.controller 'TasksController', [
  '$scope'
  'toastr'
  'Restangular'
  ($scope, toastr, Restangular) ->
    $scope.taskData = {}

    $scope.newDate = ->
      $scope.taskData.deadline = new Date()

    $scope.createTask = (project) ->
      $scope.taskData.project_id = project.id
      Restangular.one('projects', project.id).all('tasks').post($scope.taskData).then (data) ->
        project.tasks.push(data.task)
        $scope.taskData = {}
        $scope.newDate()
        toastr.success(I18n.t('toastr.task.create'))

    $scope.updateTask = (task) ->
      task.title = $scope.taskData.title
      task.deadline = $scope.taskData.deadline
      Restangular.one("tasks", task.id).put($scope.taskData).then (data) ->
        task.deadline = data.task.deadline
        task.editTask = false
        $scope.taskData = {}
        toastr.success(I18n.t('toastr.task.update'))

    $scope.taskDone = (task) ->
      Restangular.one("tasks", task.id).put(task).then (data) ->
        toastr.success(I18n.t('toastr.task.update'))

    $scope.deleteTask = (task, index) ->
      Restangular.one("tasks", task.id).remove().then (data) ->
        $scope.project.tasks.splice(index, 1)
        toastr.warning(I18n.t('toastr.task.delete'))

    $scope.showEditForm = (task) ->
      $scope.taskData.title = task.title
      $scope.taskData.deadline = new Date(task.deadline)
      task.editTask = !task.editTask

    $scope.showComments = (task) ->
      task.commentsList = !task.commentsList

    $scope.sortableOptions =
      stop: ->
        tasks = $scope.project.tasks
        tasks.map (task) ->
          index = $scope.project.tasks.indexOf(task)
          task.position = index
          Restangular.one("tasks", task.id).put(task)
        toastr.success(I18n.t('toastr.task.change_position'))


    $scope.newDate()

]
