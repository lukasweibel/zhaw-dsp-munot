import os

import openai
import requests
from dotenv import load_dotenv
from openai import OpenAI
from backend.common.llm_request import generate_text

load_dotenv()
openai_api_key = os.getenv("OPENAI_API_KEY")
openai.api_key = openai_api_key


def ask_question(question):
    url = os.getenv("SERVICE_URL", "http://127.0.0.1:5000") + "/request"
    data = {"text": question}
    response = requests.post(url, json=data)
    print("-----------------------------------------------------------------------------------")
    print("Question:", question)
    return response.text


def assert_meaning(expected, actual):
    print("Expected Response:", expected)
    print("Actual Response:", actual)
    prompt = """Vergleiche zwei Sätze auf sinnbezogene Übereinstimmung. Du erhältst zwei Eingaben: einen erwarteten (expected) und einen tatsächlichen (actual) Satz. Das Ziel ist es, festzustellen, ob beide Sätze dieselbe Aussage treffen, unabhängig von der genauen Formulierung, Details oder Reihenfolge der Informationen. Berücksichtige nur die wesentlichen Inhalte und Kernpunkte. Gib 'True' zurück, wenn die wesentlichen Informationen übereinstimmen, und 'False' nur dann, wenn sie wirklich unterschiedlich sind. Antworte nur mit 'True' oder 'False'."""
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
        # Handle unexpected values
        raise ValueError(f"Unexpected result: {result}")
