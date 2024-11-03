<script>
  import { onMount } from "svelte";

  let data = [];
  let results = {};

  async function loadTests() {
    try {
      const response = await fetch("/test");
      if (response.ok) {
        data = await response.json();
        console.log(data);
      } else {
        console.error("Failed to fetch data:", response.status);
      }
    } catch (error) {
      console.error("Error:", error);
    }
  }

  onMount(loadTests);

  export function reload() {
    loadTests();
  }

  async function runAllTests() {
    for (const item of data) {
      await runTest(item._id);
    }
  }

  async function runTest(id) {
    try {
      const response = await fetch(`/test/run/${id}`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
      });

      if (response.ok) {
        const result = await response.json();
        results[id] = result;
        console.log(results);
        console.log("Test result:", result);
      } else {
        console.error("Failed to run test:", response.status);
      }
    } catch (error) {
      console.error("Error:", error);
    }
  }
</script>

<h1>Integration Tests</h1>

<button on:click={runAllTests}>Run all tests</button>

{#if data.length > 0}
  <div class="grid-container">
    {#each data as item}
      <div
        class="grid-item {results[item._id] === true
          ? 'result-true'
          : results[item._id] === false
            ? 'result-false'
            : ''}"
      >
        <strong>Name:</strong>
        {item.name} <br />
        <strong>Question:</strong>
        {item.question} <br />
        <strong>Expected Answer:</strong>
        {item.expected} <br />
        <strong>Type:</strong>
        {item.type} <br />
        <button on:click={() => runTest(item._id)}>Run</button>
      </div>
    {/each}
  </div>
{:else}
  <p>Loading data...</p>
{/if}

<style>
  .grid-container {
    display: grid;
    grid-template-columns: 1fr; /* Single column layout */
    gap: 16px;
  }

  .grid-item {
    border: 1px solid #ccc;
    padding: 16px;
    border-radius: 8px;
    text-align: left;
    background-color: #f9f9f9; /* Default light background */
  }

  .result-true {
    background-color: #d4f8d4; /* Light green background */
  }

  .result-false {
    background-color: #f8d4d4; /* Light red background */
  }
</style>
