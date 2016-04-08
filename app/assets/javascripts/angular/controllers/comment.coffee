todoApp.controller 'CommentsController', [
  '$scope'
  'toastr'
  'Restangular'
  'attachmentFactory'
  ($scope, toastr, Restangular, attachmentFactory) ->
    $scope.files = {}
    $scope.commentData = {}

    $scope.addComment = (task) ->
      $scope.commentData.task_id = task.id
      Restangular.one('tasks', task.id).all('comments').post($scope.commentData).then (data) ->
        comment = data.comment
        if $scope.files
          _.each $scope.files, (file) ->
            attachmentFactory.create(file, comment.id).success (data) ->
              comment.attachments.push(data.attachment)
          $scope.files = {}
        $scope.commentData = {}
        task.comments.push(data.comment)
        toastr.success('Comment was created')

    $scope.deleteComment = (comment, index) ->
      Restangular.one("comments", comment.id).remove().then (data) ->
        $scope.task.comments.splice(index, 1)
        toastr.warning('Comment was deleted')

    $scope.delNewAttachment = (index) ->
      $scope.files.splice(index, 1)

    $scope.deleteAttachment = (attachment, index) ->
      Restangular.one("attachments", attachment.id).remove().then (data) ->
        $scope.comment.attachments.splice(index, 1)
        toastr.warning('Attached file was deleted')

]
