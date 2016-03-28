todoApp.controller 'CommentsController', [
  '$scope'
  '$http'
  'Upload'
  'commentFactory'
  'attachmentFactory'
  ($scope, $http, Upload, commentFactory, attachmentFactory) ->
    $scope.commentData = {}
    $scope.files = {}

    $scope.addComment = (task) ->
      commentFactory.addComment($scope.commentData, task.id).success (data) ->
        comment = data.comment
        if $scope.files
          i = 0
          while i < $scope.files.length
            file = $scope.files[i]
            uploadFile(file, comment.id).success (data) ->
              comment.attachments.push(data.attachment)
            i++
          $scope.files = {}
        $scope.commentData = {}
        task.comments.push(data.comment)

    uploadFile = (file, comment_id) ->
      Upload.upload
        url: '/comments/' + comment_id + '/attachments'
        method: 'POST'
        file: file

    $scope.deleteComment = (comment, index) ->
      $scope.task.comments.splice(index, 1)
      commentFactory.deleteComment(comment)

    $scope.delNewAttachment = (index) ->
      $scope.files.splice(index, 1)

    $scope.deleteAttachment = (attachment, index) ->
      attachmentFactory.delAttachment(attachment)
      $scope.comment.attachments.splice(index, 1)


]
