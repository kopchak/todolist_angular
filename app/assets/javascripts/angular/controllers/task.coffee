todoApp.controller 'TasksController', [
  '$scope'
  '$http'
  'taskFactory'
  ($scope, $http, taskFactory) ->
    $scope.taskData = {}

    $scope.newDate = ->
      $scope.taskData.deadline = new Date()

    $scope.createTask = (project) ->
      taskFactory.addTask($scope.taskData, project.id).success (data) ->
        project.tasks.push(data.task)
        $scope.taskData = {}
        $scope.newDate()

    $scope.updateTask = (task, taskData) ->
      task.title = taskData.title
      task.deadline = taskData.date
      taskFactory.editTask(task).success (data) ->
        task.deadline = data.task.deadline
        task.editTask = !task.editTask

    $scope.taskDone = (task) ->
      taskFactory.editTask(task)

    $scope.deleteTask = (task) ->
      $(event.target).parents('.task_block').remove()
      taskFactory.deleteTask(task)

    $scope.showEditForm = (task) ->
      $scope.taskData.title = task.title
      $scope.taskData.date = new Date(task.deadline)
      task.editTask = !task.editTask

    $scope.showComments = (task) ->
      task.commentsList = !task.commentsList

    $scope.sortableOptions =
      stop: ->
        tasks = $scope.project.tasks
        tasks.map (task) ->
          index = $scope.project.tasks.indexOf(task)
          task.position = index
          taskFactory.editTask(task)

    $scope.newDate()

]
