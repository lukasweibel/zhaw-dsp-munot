<script>
  import { onMount } from "svelte";
  import { testTypes } from "../stores/chatStore";
  import TestStatistics from "./TestStatistics.svelte";
  import { createExcelOnResults } from "../utils/excel";

  let data = [];
  let results = {};
  let type;
  let testsRunning = false;
  let testStatisticsComponent;

  async function loadTestTypes() {
    const response = await fetch(`/test/type`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });

    if (response.ok) {
      const result = await response.json();
      $testTypes = [];
      result.forEach((type) => {
        $testTypes.push(type.name);
      });
      console.log($testTypes);
    } else {
      console.error("Failed to get types:", response.status);
    }
  }

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

  export function reload() {
    loadTests();
  }

  function createEvaluationExcel() {
    runTestByType().then(() => {
      createExcelOnResults(results);
    });
  }

  async function runTestByType() {
    testsRunning = true;
    try {
      const response = await fetch(`/test/type/run/${type}`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
      });

      if (response.ok) {
        const testResults = await response.json();
        console.log(testResults);
        testResults.forEach((result) => {
          results[result.id] = {
            success: result.success,
            actual: result.actual,
            question: result.question,
            expected: result.expected,
          };
        });

        console.log(results);
      } else {
        console.error("Failed to run test:", response.status);
      }
    } catch (error) {
      console.error("Error:", error);
    }
    testsRunning = false;
    testStatisticsComponent.loadTestResults();
    return;
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
      } else {
        console.error("Failed to run test:", response.status);
      }
    } catch (error) {
      console.error("Error:", error);
    }
  }

  function changeSelection() {}

  onMount(() => {
    loadTests();
    loadTestTypes();
  });
</script>

<select id="type" name="type" bind:value={type} on:change={changeSelection}>
  <option selected value="all">All</option>
  {#if $testTypes && $testTypes.length > 0}
    {#each $testTypes as type}
      <option value={type}>{type}</option>
    {/each}
  {:else}
    <option disabled value="">Loading test types...</option>
  {/if}
</select>

<button on:click={runTestByType} disabled={testsRunning}>Run all tests</button>

<button on:click={createEvaluationExcel}>Create Evaluation Excel</button>

<TestStatistics {type} bind:this={testStatisticsComponent} />

{#if data.length > 0}
  <div class="grid-container">
    {#each data as item}
      {#if item.type === type || type === "all"}
        <details
          class="grid-item {results[item._id]?.success === true
            ? 'result-true'
            : results[item._id]?.success === false
              ? 'result-false'
              : ''}"
        >
          <summary>
            <div>
              <strong>{item.name}</strong>
              {#if results[item._id]?.success === true}
                <span class="status-pass">Passed</span>
              {:else if results[item._id]?.success === false}
                <span class="status-fail">Failed</span>
              {:else}
                <span class="status-pending">Not run yet</span>
              {/if}
              <button class="run-button" on:click={() => runTest(item._id)}
                >Run Test</button
              >
            </div>
            {#if results[item._id]?.actual}
              <div>
                <p><strong>Actual:</strong> {results[item._id]?.actual}</p>
              </div>
            {/if}
          </summary>
          <div class="details-content">
            <p><strong>Question:</strong> {item.question}</p>
            <p><strong>Expected Answer:</strong> {item.expected}</p>
            <p><strong>Type:</strong> {item.type}</p>
            {#if item.result}
              <details>
                <summary>Previous Results</summary>
                <div class="previous-results">
                  {#each item.result as result}
                    <details
                      class="grid-item {result.success === true
                        ? 'result-true'
                        : result.success === false
                          ? 'result-false'
                          : ''}"
                    >
                      <summary
                        ><strong>Run:</strong>
                        {new Date(result.timestamp).toLocaleString()}</summary
                      >
                      <div class="previous-result">
                        <p><strong>Actual:</strong> {result.actual}</p>
                        <p>
                          <strong>Success:</strong>
                          {result.success ? "Yes" : "No"}
                        </p>
                      </div>
                    </details>
                  {/each}
                </div>
              </details>
            {/if}
          </div>
        </details>
      {/if}
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
    display: flex;
    flex-direction: column;
    border: 1px solid #ccc;
    border-radius: 8px;
    background-color: #f9f9f9;
    overflow: hidden;
    width: 100%;
    margin: 0;
  }

  summary {
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

  summary {
    display: block;
    padding: 1em;
    border: 1px solid #ddd;
    margin-bottom: 1em;
  }

  summary > div {
    display: flex;
    align-items: center;
    gap: 1em;
  }
</style>
