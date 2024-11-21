<script>
  import { onMount } from "svelte";
  import Chart from "chart.js/auto";

  export let type;

  let chartCanvas;
  let chartInstance;

  async function loadTestResults() {
    const response = await fetch(`/test/run/${type}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
    });

    if (response.ok) {
      const result = await response.json();
      console.log(result);
      generateHistogram(result);
    } else {
      console.error("Failed to get test results:", response.status);
    }
  }

  function generateHistogram(data) {
    // Sort data by date (timestamp) in ascending order
    data.sort((a, b) => new Date(a.timestamp) - new Date(b.timestamp));

    // Prepare data for the chart
    const labels = data.map(
      (run) => new Date(run.timestamp).toLocaleString() // Include date and time
    );
    const successfulTests = data.map(
      (run) => run.results.filter((result) => result.success).length
    );
    const failedTests = data.map(
      (run) => run.results.filter((result) => !result.success).length
    );

    // Destroy the previous chart instance if it exists
    if (chartInstance) {
      chartInstance.destroy();
    }

    // Create a new Chart.js instance
    chartInstance = new Chart(chartCanvas, {
      type: "bar",
      data: {
        labels: labels,
        datasets: [
          {
            label: "Failed Tests",
            data: failedTests,
            backgroundColor: "gray",
          },
          {
            label: "Successful Tests",
            data: successfulTests,
            backgroundColor: "green",
          },
        ],
      },
      options: {
        responsive: true,
        plugins: {
          legend: {
            display: true,
          },
        },
        scales: {
          x: {
            stacked: true, // Enable stacking for x-axis
            title: {
              display: true,
              text: "Date and Time",
            },
          },
          y: {
            stacked: true, // Enable stacking for y-axis
            title: {
              display: true,
              text: "Number of Tests",
            },
          },
        },
      },
    });
  }

  $: if (type) {
    loadTestResults();
  }

  onMount(() => {
    loadTestResults();
  });
</script>

<details>
  <summary>Statistic</summary>
  <h1>Statistics for {type}</h1>
  <canvas bind:this={chartCanvas}></canvas>
</details>
