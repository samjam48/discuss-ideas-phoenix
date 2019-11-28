// NOTE: The contents of this file will only be executed if
// you uncomment its entry in "web/static/js/app.js".

// To use Phoenix channels, the first step is to import Socket
// and connect at the socket path in "lib/my_app/endpoint.ex":
import { Socket } from "phoenix";

let socket = new Socket("/socket", { params: { token: window.userToken } });

console.log("window userToken", window);
console.log("window userToken", window.userToken);
console.log("socket", socket);

socket.connect();

const createSocket = topicId => {
  let channel = socket.channel(`comments:${topicId}`, {});
  channel
    .join()
    .receive("ok", resp => {
      console.log(resp);
      renderCommentsList(resp.comments);
    })
    .receive("error", resp => {
      console.log("Unable to join", resp);
    });

  channel.on(`comments:${topicId}:new`, renderComment);

  document.querySelector("button").addEventListener("click", () => {
    const content = document.querySelector("textarea").value;

    channel.push("comment:add", { content: content });
  });
};

const renderCommentsList = comments => {
  const renderedCommentsList = comments.map(comment => {
    return commentTemplate(comment);
  });

  document.querySelector(".collection").innerHTML = renderedCommentsList.join(
    ""
  );
};

const renderComment = event => {
  const renderedComment = commentTemplate(event.comment);

  document.querySelector(".collection").innerHTML += renderedComment;
};

const commentTemplate = comment => {
  let email = "Anonymous";
  let date = comment.inserted_at.slice(0, 10);
  if (comment.user) {
    console.log(comment);
    email = comment.user.email;
  }

  return `
    <li class="comment-container">
      <div class="comment-content">
      ${comment.content}
      </div>
      <div class="comment-extra comment-user">
        ${email}
      </div>
      <div class="comment-extra comment-date">
        ${date}
      </div>
    </li>
  `;
};

window.createSocket = createSocket;
