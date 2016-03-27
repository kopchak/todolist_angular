todoApp.factory 'commentFactory', [
  '$http'
  ($http) ->
    {
      addComment: (commentData, task_id) ->
        $http
          method: 'POST'
          url: '/tasks/' + task_id + '/comments'
          params: commentData

      deleteComment: (commentData) ->
        $http.delete '/tasks/' + commentData.task_id + '/comments/' + commentData.id
    }
]