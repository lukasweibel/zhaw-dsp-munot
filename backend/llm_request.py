import os
import openai
from openai import OpenAI
from dotenv import load_dotenv

load_dotenv()

openai_api_key = os.getenv("OPENAI_API_KEY")

openai.api_key = openai_api_key


def generate_text(prompt):
    try:
        client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"),)
        chat_completion = client.chat.completions.create(
            messages=[{"role": "user","content": "Say i am Gpt3.5",}],model="gpt-3.5-turbo",)

        generated_text = chat_completion.choices[0].message.content
        print(generated_text)
        return str(generated_text)
    except Exception as e:
        print(f"Error: {e}")
        return None
