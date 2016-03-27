todoApp.controller 'CommentsController', [
  '$scope'
  '$http'
  'Upload'
  'commentFactory'
  ($scope, $http, Upload, commentFactory) ->
    $scope.commentData = {}

    $scope.addComment = (task) ->
      commentFactory.addComment($scope.commentData, task.id).success (data) ->
        if $scope.files
          console.log 'has file'
        else
          console.log 'without file'
        $scope.commentData = {}
        task.comments.push(data.comment)

    $scope.deleteComment = (comment, index) ->
      $scope.task.comments.splice(index, 1)
      commentFactory.deleteComment(comment)

]