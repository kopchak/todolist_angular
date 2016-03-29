todoApp.factory 'projectFactory', [
  '$http'
  ($http) ->
    {
      getProjects: ->
        $http.get '/projects'

      create: (projectData) ->
        $http
          method: 'POST'
          url: '/projects'
          params: projectData

      update: (projectData) ->
        $http
          method: 'PATCH'
          url: '/projects/' + projectData.id
          params: projectData

      destroy: (projectData) ->
        $http.delete '/projects/' + projectData.id
    }
]

