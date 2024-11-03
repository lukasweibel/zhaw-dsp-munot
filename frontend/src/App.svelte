<!-- App.svelte -->
<script>
  import Chat from "./components/Chat.svelte";
  import TestForm from "./components/TestForm.svelte";

  let currentPage = "chat";

  function navigate(page) {
    currentPage = page;
  }
</script>

<nav>
  <div class="navbar">
    <h1>Munot DSP Projekt</h1>
    <div>
      <a on:click={() => navigate("chat")}>Chat</a>
      <a on:click={() => navigate("history")}>Tests</a>
    </div>
  </div>
</nav>

{#if currentPage === "chat"}
  <Chat />
{/if}

{#if currentPage === "history"}
  <TestForm />
{/if}

<style>
  nav {
    width: 100%;
    background-color: #0056b3;
    padding: 1em 0;
    box-shadow: 0 1px 8px rgba(0, 0, 0, 0.1);
  }

  .navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 1em;
  }

  .navbar h1 {
    color: #ffffff;
    margin: 0;
  }

  .navbar div {
    display: flex;
    gap: 10px;
  }

  .navbar a {
    color: #ffffff;
    text-decoration: none;
    padding: 0.5em 1em;
    background-color: #003875;
    border-radius: 4px;
    transition: background-color 0.3s ease;
  }

  .navbar a:hover {
    background-color: #00264d;
  }
</style>
