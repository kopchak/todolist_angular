todoApp.controller 'CommentsController', [
  '$scope'
  'commentFactory'
  'attachmentFactory'
  ($scope, commentFactory, attachmentFactory) ->
    $scope.files = {}
    $scope.commentData = {}

    $scope.addComment = (task) ->
      $scope.commentData.task_id = task.id
      commentFactory.create($scope.commentData).success (data) ->
        comment = data.comment
        if $scope.files
          _.each $scope.files, (file) ->
            attachmentFactory.create(file, comment.id).success (data) ->
              comment.attachments.push(data.attachment)
          $scope.files = {}
        $scope.commentData = {}
        task.comments.push(data.comment)

    $scope.deleteComment = (comment, index) ->
      commentFactory.destroy(comment).success (data) ->
        $scope.task.comments.splice(index, 1)

    $scope.delNewAttachment = (index) ->
      $scope.files.splice(index, 1)

    $scope.deleteAttachment = (attachment, index) ->
      attachmentFactory.destroy(attachment).success (data) ->
        $scope.comment.attachments.splice(index, 1)

]
