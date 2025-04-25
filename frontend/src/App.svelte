<!-- App.svelte -->
<script>
  import Chat from "./components/Chat.svelte";
  import HistoryViewer from "./components/HistoryViewer.svelte";
  import TestForm from "./components/TestForm.svelte";

  let currentPage = "chat";

  function navigate(page) {
    currentPage = page;
  }
</script>

<div class="container">
  <div class="navbar">
    <nav>
      <h1>Munot DSP Projekt</h1>
      <div class="desktop-only">
        <a on:click={() => navigate("chat")}>Chat</a>
        <a on:click={() => navigate("tests")}>Tests</a>
        <HistoryViewer />
      </div>
    </nav>
  </div>
  <div class="content">
    {#if currentPage === "chat"}
      <Chat />
    {/if}

    {#if currentPage === "tests"}
      <TestForm />
    {/if}
  </div>
</div>

<style>
  .container {
    display: grid;
    grid-template-rows: 100px 1fr;
    height: 98vh;
    overflow: scroll;
  }

  nav {
    background-color: #0056b3;
  }

  .navbar {
    grid-row: 1;
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
