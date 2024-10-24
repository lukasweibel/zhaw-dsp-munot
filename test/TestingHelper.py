import os

import openai
import requests
from dotenv import load_dotenv
from openai import OpenAI

load_dotenv()
openai_api_key = os.getenv("OPENAI_API_KEY")
openai.api_key = openai_api_key


def generate_text(prompt):
    try:
        client = OpenAI(api_key=os.environ.get("OPENAI_API_KEY"), )
        chat_completion = client.chat.completions.create(
            messages=[{"role": "user", "content": prompt, }], model="gpt-3.5-turbo", )

        generated_text = chat_completion.choices[0].message.content
        print(generated_text)
        return str(generated_text)
    except Exception as e:
        print(f"Error: {e}")
        return None


def ask_question(question):
    url = "http://127.0.0.1:5000/request"
    data = {"text": question}
    response = requests.post(url, json=data)
    print("Response Text:", response.text)
    return response.text


def assert_meaning(expected, actual):
    prompt = """Vergleiche zwei kurze Sätze und führe eine sinnbezogene Überprüfung durch.
             Du erhältst zwei Eingaben: einen erwarteten (expected) und einen tatsächlichen (actual) Satz.
             Das Ziel ist es festzustellen, ob die Bedeutung beider Sätze übereinstimmt,
             unabhängig von der Formulierung. Gib nur True zurück, wenn die Bedeutung der Sätze gleich ist, oder False,
              wenn sie unterschiedlich ist. Antworte nur mit 'True' oder 'False'"""
    prompt += "Expected: " + expected + "\n"
    prompt += "Actual: " + actual + "\n"
    response = generate_text(prompt)
    return parse_to_bool(response)


def parse_to_bool(result):
    if result == "True":
        return True
    elif result == "False":
        return False
    else:
        raise ValueError(f"Unexpected result: {result}")  # Handle unexpected values
