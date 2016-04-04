todoApp.factory 'commentFactory', [
  '$http'
  ($http) ->
    {
      create: (commentData) ->
        $http
          method: 'POST'
          url: '/tasks/' + commentData.task_id + '/comments'
          params: commentData

      destroy: (commentData) ->
        $http.delete '/comments/' + commentData.id
    }
]
