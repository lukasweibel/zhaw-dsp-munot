import os

import requests
from dotenv import load_dotenv

load_dotenv()

openai_api_key = os.getenv("OPENAI_API_KEY")

def generate_picture(prompt):
    headers = {
        'Authorization': f'Bearer {openai_api_key}',
        'Content-Type': 'application/json',
    }

    data = {
        "model": "dall-e-3",
        "prompt": prompt,
        "n": 1, 
        "size": "1024x1024",
        "quality": "hd",
        "style": "natural"
    }

    response = requests.post('https://api.openai.com/v1/images/generations', headers=headers, json=data)

    if response.status_code == 200:
        print("Image generated successfully!")
        image_url = response.json()['data'][0]['url']

        image_response = requests.get(image_url)
        if image_response.status_code == 200:
            print("Image downloaded successfully.")
            return image_response.content
        else:
            print("Failed to download the image")
            return None
    else:
        print("Failed to generate image")
        print(response.text)
        return None
