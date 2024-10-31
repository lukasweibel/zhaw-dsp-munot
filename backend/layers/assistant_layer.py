from openai import OpenAI
import openai
from dotenv import load_dotenv
import os


load_dotenv()

openai_api_key = os.getenv("OPENAI_API_KEY")

openai.api_key = openai_api_key

assistant_id = 'asst_1VKzsJRDDntl8V30PIVQhtni'


def get_pdf_answer(question):
    client = OpenAI()

    thread = client.beta.threads.create()

    message = client.beta.threads.messages.create(
        thread_id=thread.id,
        role="user",
        content=question
    )

    run = client.beta.threads.runs.create_and_poll(
        thread_id=thread.id,
        assistant_id=assistant_id,
        instructions="Please answer the question short and simple. Just give back the times."
    )

    if run.status == 'completed':
        messages = client.beta.threads.messages.list(thread_id=thread.id)
        for message in messages.data:
            if message.role == 'assistant':
                # Accessing the text content specifically
                text_content = message.content[0].text.value
                print(text_content)
                return text_content
    else:
        print(run.status)
