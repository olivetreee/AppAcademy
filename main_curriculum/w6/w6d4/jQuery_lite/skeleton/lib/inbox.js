const MessagesStore = require('./messages_store');

class Inbox {
  constructor() {
    debugger
    let messagesStore = new MessagesStore();
    this.messages = messagesStore.getInboxMessages();
  }

  render() {
    let ulContainer = document.createElement("ul");
    ulContainer.className = "messages";
    ulContainer.innerHTML = "An inbox message written by a dinosaur";
    return ulContainer;
  }

}

module.exports = Inbox;
