<script>
  import { onMount } from "svelte";
  import { chatHistory, currentChatId } from "../stores/chatStore";

  let chatHistories = [];

  onMount(async () => {
    await getHistories();
  });

  async function getHistories() {
    try {
      const response = await fetch("/history", {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
      });

      if (!response.ok) {
        alert("Es ist ein Fehler aufgetreten");
        throw new Error("Error");
      }

      const responseData = await response.json();
      chatHistories = responseData; // Save response data to chatHistories
    } catch (error) {
      console.error("Fetch error:", error);
    }
  }

  function handleChatChange(event) {
    const selectedChatId = event.target.value;

    chatHistory.update((current) => {
      console.log(current);
      // Initialize an empty array to clear the existing chat history
      current = [];

      if (selectedChatId) {
        currentChatId.set(selectedChatId);

        const selectedChat = chatHistories.find(
          (chat) => chat.chat_id === selectedChatId
        );
        console.log(selectedChat);

        // Transform the selected chat's messages to the desired structure
        const transformedMessages = selectedChat.messages.map((msg) => ({
          sender: msg.role, // 'role' can be 'user' or 'bot'
          message: msg.message,
        }));

        // Set the transformed messages as the new chat history
        current.push(...transformedMessages);
      } else {
        currentChatId.set(null);
      }

      return current;
    });
  }
</script>

<div>
  History:
  <select on:change={handleChatChange}>
    <option value="">new Chat</option>
    {#each chatHistories as history}
      <option value={history.chat_id}>{history.chat_id}</option>
    {/each}
  </select>
</div>
