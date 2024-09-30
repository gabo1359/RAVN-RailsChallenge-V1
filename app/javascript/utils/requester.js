export async function requester(url) {
  try {
    const options = {
      method: 'GET',
      headers: { "Accept": "text/vnd.turbo-stream.html" }
    };

    const response = await fetch(url, options)

    if (response.ok) {
      const streamMessage = await response.text();
      Turbo.renderStreamMessage(streamMessage)
    } else {
      throw new Error("Failed requesting data!");
    }
  } catch (error) {
    console.error(error);
  }
}
