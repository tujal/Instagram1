// document.addEventListener('turbo:load', function () {
//     document.querySelectorAll('.delete-comment').forEach(function (button) {
//       button.addEventListener('ajax:success', function () {
//         const commentId = this.dataset.commentId;
//         const commentElement = document.getElementById('comment_' + commentId);
//         commentElement.remove();
//       });
//     });
//   });