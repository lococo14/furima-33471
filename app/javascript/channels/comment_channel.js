import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const nickName =  data.user.nickname ;
    const text =  data.content.comment ;
    const html = `
      <p><strong><a href="#">${nickName}</a> : </strong>
      ${text}</p>
    `
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('comment_comment');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
