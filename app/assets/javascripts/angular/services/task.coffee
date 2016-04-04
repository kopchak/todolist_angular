todoApp.factory 'taskFactory', [
  '$http'
  ($http) ->
    {
      create: (taskData) ->
        $http
          method: 'POST'
          url: '/projects/' + taskData.project_id + '/tasks'
          params: taskData

      update: (taskData) ->
        $http
          method: 'PATCH'
          url: '/tasks/' + taskData.id
          params: taskData

      destroy: (taskData) ->
        $http.delete '/tasks/' + taskData.id
    }
]
