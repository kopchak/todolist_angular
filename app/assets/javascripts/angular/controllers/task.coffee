todoApp.controller 'TasksController', [
  '$scope'
  'taskFactory'
  ($scope, taskFactory) ->
    $scope.taskData = {}

    $scope.newDate = ->
      $scope.taskData.deadline = new Date()

    $scope.createTask = (project) ->
      $scope.taskData.project_id = project.id
      taskFactory.create($scope.taskData).success (data) ->
        project.tasks.push(data.task)
        $scope.taskData = {}
        $scope.newDate()

    $scope.updateTask = (task) ->
      task.title = $scope.taskData.title
      task.deadline = $scope.taskData.deadline
      taskFactory.update(task).success (data) ->
        task.deadline = data.task.deadline
        task.editTask = false
        $scope.taskData = {}

    $scope.taskDone = (task) ->
      taskFactory.update(task)

    $scope.deleteTask = (task, index) ->
      taskFactory.destroy(task).success (data) ->
        $scope.project.tasks.splice(index, 1)

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
          taskFactory.update(task)

    $scope.newDate()

]
