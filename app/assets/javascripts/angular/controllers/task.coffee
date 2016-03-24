todoApp.controller 'TasksController', [
  '$scope'
  '$http'
  'taskFactory'
  ($scope, $http, taskFactory) ->
    $scope.taskData = {}
    $scope.showMe = false
    $scope.taskData.deadline = new Date()

    $scope.createTask = (project) ->
      taskFactory.addTask($scope.taskData, project.id).success (data) ->
        project.tasks.push(data.task)
        $scope.taskData = {}

    $scope.updateTask = (task) ->
      $scope.showForm(task)
      taskFactory.editTask(task)

    $scope.deleteTask = (task) ->
      $(event.target).parents('.task_block').remove()
      taskFactory.deleteTask(task)

    $scope.toggleTask = ->
      $scope.showMe = !$scope.showMe

    $scope.showForm = (task) ->
      $scope.editTask = !$scope.editTask
      $scope.task.deadline = new Date(task.deadline)
      # $scope.task.deadline = new Date(task.deadline).toLocaleDateString().split('/').join('-')
      # $scope.task.deadline = new Date().toLocaleDateString().split('/').join('-')
      # debugger
]

