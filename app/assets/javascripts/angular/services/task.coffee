todoApp.factory 'taskFactory', [
  '$http'
  ($http) ->
    {
      addTask: (taskData, project_id) ->
        $http
          method: 'POST'
          url: '/projects/' + project_id + '/tasks'
          params: taskData

      editTask: (taskData) ->
        $http
          method: 'PATCH'
          url: '/projects/' + taskData.project_id + '/tasks/' + taskData.id
          params: {id: taskData.id, title: taskData.title, deadline: taskData.deadline}

      deleteTask: (taskData) ->
        $http.delete '/projects/' + taskData.project_id + '/tasks/' + taskData.id
    }
]
