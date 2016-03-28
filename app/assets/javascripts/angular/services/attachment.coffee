todoApp.factory 'attachmentFactory', [
  '$http'
  ($http) ->
    {
      delAttachment: (attachment) ->
        $http.delete '/comments/' + attachment.comment_id + '/attachments/' + attachment.id
    }
]
