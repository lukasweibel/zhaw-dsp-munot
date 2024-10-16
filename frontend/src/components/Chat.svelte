<script>
  let text = "";
  let isSubmitting = false;
  let chatHistory = [];

  async function sendRequest(event) {
    event.preventDefault();
    if (isSubmitting) return;

    isSubmitting = true;

    try {
      chatHistory = [...chatHistory, { sender: "user", message: text }];
      const response = await fetch("/request", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ text: text }),
      });

      if (!response.ok) {
        alert("Es ist ein Fehler aufgetreten");
        throw new Error("Error");
      }

      const responseData = await response.json();
      chatHistory = [...chatHistory, { sender: "bot", message: responseData }];
      console.log(chatHistory);
    } catch (error) {
      console.error("Fetch error:", error);
    } finally {
      isSubmitting = false;
      text = "";
    }
  }
</script>

<div id="chatContainer">
  <div id="chatHistory">
    {#each chatHistory as { sender, message }}
      <div class={sender === "user" ? "userMessage" : "botMessage"}>
        {sender.charAt(0).toUpperCase() + sender.slice(1) + ": " + message}
      </div>
    {/each}
  </div>

  <form on:submit={sendRequest}>
    <div class="inputContainer">
      <textarea bind:value={text} placeholder="Type your message here"
      ></textarea>
      <button type="submit" disabled={isSubmitting}>Send</button>
    </div>
  </form>
</div>

<style>
  #chatContainer {
    display: flex;
    flex-direction: column;
    height: 100%;
  }

  #chatHistory {
    flex: 1;
    max-height: 400px;
    overflow-y: auto;
    border: 1px solid #ccc;
    padding: 10px;
    background-color: #f9f9f9;
    border-radius: 10px;
    margin-bottom: 10px;
  }

  .userMessage {
    background-color: #a8e6cf;
    color: black;
    padding: 10px;
    border-radius: 10px;
    margin: 5px 0;
    text-align: left;
    align-self: flex-end;
    max-width: 70%;
    margin-left: auto;
  }

  .botMessage {
    background-color: #cfd8dc; /* More grey for bot messages */
    color: black;
    padding: 10px;
    border-radius: 10px;
    margin: 5px 0;
    text-align: left;
    align-self: flex-start;
    max-width: 70%;
  }

  .inputContainer {
    display: flex;
    align-items: center;
  }

  textarea {
    height: 50px;
    resize: none;
    border-radius: 5px;
    border: 1px solid #ccc;
    padding: 10px;
    margin-right: 5px;
    flex: 1;
  }

  button {
    background-color: #4caf50;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 10px;
    cursor: pointer;
  }

  button:disabled {
    background-color: #ccc;
    cursor: not-allowed;
  }
</style>
