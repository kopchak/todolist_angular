todoApp.factory 'projectFactory', [
  '$http'
  ($http) ->
    {
      getProjects: ->
        $http.get '/projects'

      addProject: (projectData) ->
        $http
          method: 'POST'
          url: '/projects'
          params: {title: projectData.title}

      updateProject: (projectData) ->
        $http
          method: 'PATCH'
          url: '/projects/' + projectData.id
          params: {id: projectData.id, title: projectData.title}

      deleteProject: (projectData) ->
        $http.delete '/projects/' + projectData.id
    }
]

