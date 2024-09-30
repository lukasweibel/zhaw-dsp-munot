<script>
  export let pictureId;

  let text = "";
  let isSubmitting = false;

  $: pictureId;

  async function sendRequest(event) {
    event.preventDefault();
    if (isSubmitting) return; // Prevent multiple submissions

    isSubmitting = true;

    try {
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

      alert(responseData);
    } catch (error) {
      console.error("Fetch error:", error);
    } finally {
      isSubmitting = false;
      feedbackText = "";
    }
  }
</script>

<form>
  <input type="text" bind:value={text} required />
  <button on:click={sendRequest} disabled={isSubmitting}>Senden</button>
</form>
