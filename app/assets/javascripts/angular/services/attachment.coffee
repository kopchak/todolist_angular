todoApp.factory 'attachmentFactory', [
  '$http'
  'Upload'
  ($http, Upload) ->
    {
      create: (file, comment_id) ->
        Upload.upload
          method: 'POST'
          url: '/comments/' + comment_id + '/attachments'
          file: file
    }
]
