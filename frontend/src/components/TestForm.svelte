<script>
  import { testTypes } from "../stores/chatStore";
  import TestViewer from "./TestViewer.svelte";

  let name = "";
  let question = "";
  let expected = "";
  let type = "";
  let testViewerRef;
  let newTestType = "";

  async function submitTestType(event) {
    event.preventDefault();

    const formData = {
      name: newTestType,
    };

    const response = await fetch("/test/type", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(formData),
    });

    if (response.ok) {
      const result = await response.json();
      console.log("Form submitted successfully:", result);

      testTypes.set([...$testTypes, newTestType]);

      newTestType = "";

      testViewerRef.reload();
    } else {
      console.error("Failed to submit form:", response.status);
    }
  }

  async function submitForm(event) {
    event.preventDefault();

    const formData = {
      name,
      question,
      expected,
      type,
    };

    try {
      const response = await fetch("/test/create", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(formData),
      });

      if (response.ok) {
        const result = await response.json();
        console.log("Form submitted successfully:", result);

        // Clear the form fields
        name = "";
        question = "";
        expected = "";
        type = "IntegrationTest";

        // Reload TestViewer
        testViewerRef.reload();
      } else {
        console.error("Failed to submit form:", response.status);
      }
    } catch (error) {
      console.error("Error:", error);
    }
  }
</script>

<div class="form-container">
  <details>
    <summary>Add Test Type</summary>

    <form on:submit={submitTestType}>
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" bind:value={newTestType} />

      <input type="submit" value="Submit" />
    </form>
  </details>
  <details>
    <summary>Add Test</summary>

    <form on:submit={submitForm}>
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" bind:value={name} />

      <label for="question">Question:</label>
      <input type="text" id="question" name="question" bind:value={question} />

      <label for="expected">Expected Answer:</label>
      <input type="text" id="expected" name="expected" bind:value={expected} />

      <label for="type">Type:</label>
      <select id="type" name="type" bind:value={type}>
        {#if $testTypes && $testTypes.length > 0}
          {#each $testTypes as type}
            <option value={type}>{type}</option>
          {/each}
        {:else}
          <option disabled value="">Loading test types...</option>
        {/if}
      </select>

      <input type="submit" value="Submit" />
    </form>
  </details>

  <TestViewer bind:this={testViewerRef} />
</div>

<style>
  .form-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 80%;
    margin: 0 auto;
    padding: 2em;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
  }

  details {
    width: 100%;
  }

  summary {
    cursor: pointer;
    font-weight: bold;
    margin-bottom: 1em;
  }

  form {
    width: 100%;
  }

  label {
    display: block;
    margin-bottom: 0.5em;
    font-weight: bold;
  }

  input[type="text"],
  select {
    display: block;
    width: 100%;
    margin-bottom: 1em;
    padding: 0.5em;
    border: 1px solid #ccc;
    border-radius: 4px;
  }

  input[type="submit"] {
    width: 100%;
    padding: 0.75em;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }

  input[type="submit"]:hover {
    background-color: #0056b3;
  }
</style>
