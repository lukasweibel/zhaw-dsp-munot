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
        results[id] = { success: result.success, actual: result.actual };
        console.log(results);
        console.log("Test success:", result.success);
        console.log("Test actual:", result.actual);
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
      <details
        class="grid-item {results[item._id]?.success === true
          ? 'result-true'
          : results[item._id]?.success === false
            ? 'result-false'
            : ''}"
      >
        <summary>
          <strong>{item.name}</strong>
          - Status:
          {#if results[item._id]?.success === true}
            <span class="status-pass">Passed</span>
          {:else if results[item._id]?.success === false}
            <span class="status-fail">Failed</span>
          {:else}
            <span class="status-pending">Not run yet</span>
          {/if}
          <!-- Move the Run Test button here -->
          <button class="run-button" on:click={() => runTest(item._id)}
            >Run Test</button
          >
        </summary>
        <div class="details-content">
          <p><strong>Question:</strong> {item.question}</p>
          <p><strong>Expected Answer:</strong> {item.expected}</p>
          <p><strong>Type:</strong> {item.type}</p>
          {#if results[item._id]?.actual}
            <p><strong>Actual:</strong> {results[item._id]?.actual}</p>
          {/if}
          {#if item.result}
            <div class="previous-results">
              <h4>Previous Results:</h4>
              {#each item.result as result}
                <div class="previous-result">
                  <p><strong>Actual:</strong> {result.actual}</p>
                  <p>
                    <strong>Success:</strong>
                    {result.success ? "Yes" : "No"}
                  </p>
                  <p>
                    <strong>Timestamp:</strong>
                    {new Date(result.timestamp).toLocaleString()}
                  </p>
                </div>
              {/each}
            </div>
          {/if}
        </div>
      </details>
    {/each}
  </div>
{:else}
  <p>Loading data...</p>
{/if}

<style>
  .grid-container {
    display: flex;
    flex-direction: column;
    gap: 16px;
    width: 100%;
  }

  .grid-item {
    border: 1px solid #ccc;
    border-radius: 8px;
    background-color: #f9f9f9;
    overflow: hidden;
    width: 100%;
  }

  summary {
    padding: 16px;
    cursor: pointer;
    user-select: none;
    outline: none;
    display: flex;
    align-items: center;
    justify-content: space-between;
  }

  .run-button {
    margin-left: 16px;
  }

  .details-content {
    padding: 0 16px 16px 16px;
  }

  .result-true > summary {
    background-color: #d4f8d4;
  }

  .result-false > summary {
    background-color: #f8d4d4;
  }

  .status-pass {
    color: green;
    font-weight: bold;
  }

  .status-fail {
    color: red;
    font-weight: bold;
  }

  .status-pending {
    color: gray;
    font-weight: bold;
  }

  .previous-results {
    margin-top: 16px;
  }

  .previous-result {
    border-top: 1px solid #ccc;
    padding-top: 8px;
  }

  button {
    margin-top: 16px;
  }
</style>
