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
          url: '/projects/' + taskData.project_id + '/tasks/' + taskData.id
          params: taskData

      destroy: (taskData) ->
        $http.delete '/projects/' + taskData.project_id + '/tasks/' + taskData.id
    }
]
