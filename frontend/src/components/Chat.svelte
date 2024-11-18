<script>
  import { generateUUID } from "../utils/utils";
  import { chatHistory, currentChatId } from "../stores/chatStore";

  let chatId;
  let text = "";
  let isSubmitting = false;

  async function sendRequest(event) {
    if (!chatId) {
      chatId = generateUUID();
      $currentChatId = chatId;
    }

    event.preventDefault();
    if (isSubmitting) return;

    isSubmitting = true;

    try {
      $chatHistory = [...$chatHistory, { sender: "user", message: text }];
      const response = await fetch("/request", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ text: text, chatId: chatId }),
      });

      if (!response.ok) {
        alert("Es ist ein Fehler aufgetreten");
        throw new Error("Error");
      }
      text = "";
      const responseData = await response.json();
      $chatHistory = [
        ...$chatHistory,
        { sender: "bot", message: responseData },
      ];
      console.log(chatHistory);
    } catch (error) {
      console.error("Fetch error:", error);
    } finally {
      isSubmitting = false;
      text = "";
    }

    console.log($chatHistory);
  }

  function handleKeyDown(event) {
    if (event.key === "Enter" && !event.shiftKey) {
      event.preventDefault();
      sendRequest(event);
    }
  }
</script>

<div id="chatContainer">
  <div id="chatHistory">
    {#each $chatHistory as { sender, message }}
      <div class={sender === "user" ? "userMessage" : "botMessage"}>
        {message}
      </div>
    {/each}
  </div>

  <div class="inputContainer">
    <form on:submit={sendRequest} class="inputWrapper">
      <textarea
        bind:value={text}
        placeholder="Type your message here"
        on:keydown={handleKeyDown}
      ></textarea>
      <button type="submit" disabled={isSubmitting}>Send</button>
    </form>
  </div>
</div>

<style>
  #chatContainer {
    display: flex;
    flex-direction: column;
    height: 100%;
  }

  #chatHistory {
    overflow-y: auto;
    border: 1px solid #ccc;
    background-color: #f9f9f9;
    border-radius: 10px;
    flex-grow: 1;
  }

  .userMessage {
    background-color: #a8e6cf;
    padding: 10px;
    border-radius: 10px;
    margin: 5px 5px;
    text-align: left;
    align-self: flex-end;
    max-width: 60%;
    margin-left: auto;
    min-width: none;
  }

  .botMessage {
    background-color: #cfd8dc; /* More grey for bot messages */
    padding: 10px;
    border-radius: 10px;
    margin: 5px 0 0 5px;
    text-align: left;
    white-space: pre-line;
    align-self: flex-start;
    max-width: 60%;
  }

  .inputWrapper {
    margin-top: 10px;
    display: flex;
    gap: 5px;
  }

  textarea {
    height: 50px;
    resize: none;
    border-radius: 5px;
    border: 1px solid #ccc;
    padding: 10px;
    flex: 1;
  }

  button {
    width: 80px;
    height: 50px;
    background-color: #4caf50;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    padding: 0 15px;
    align-items: center;
  }

  button:disabled {
    background-color: #ccc;
    cursor: not-allowed;
  }
</style>
