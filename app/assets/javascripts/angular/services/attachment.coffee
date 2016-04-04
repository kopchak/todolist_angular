todoApp.factory 'attachmentFactory', [
  '$http'
  'Upload'
  ($http, Upload) ->
    {
      create: (file, comment_id) ->
        Upload.upload
          url: '/comments/' + comment_id + '/attachments'
          method: 'POST'
          file: file

      destroy: (attachment) ->
        $http.delete '/attachments/' + attachment.id
    }
]
