from flask import json
from jsonschema import validate
from backend.common.file_helper import load_txt_file
from backend.common.llm_request import generate_text

schema = {
    "$schema": "http://json-schema.org/draft-07/schema#",
    "type": "array",
    "items": {
        "type": "object",
        "properties": {
            "layer": {
                "type": "integer",
                "description": "The layer number from which the answer is fetched."
            },
            "frage": {
                "type": "string",
                "description": "The question to be answered from the specified layer."
            }
        },
        "required": ["layer", "frage"],
        "additionalProperties": False
    },
    "minItems": 1,
    "description": "Array of objects representing questions and the respective layers that can answer them."
}


def ask_for_needed_layers(user_question):
    base_prompt = load_txt_file('./backend/layers/manager_layer_prompt.txt')
    prompt = prompt = base_prompt.replace('{user_frage}', str(user_question))
    layers = generate_text(prompt)
    layers = layers.replace("'", '"')
    layers_json = json.loads(layers)
    validate(instance=layers_json, schema=schema)
    print(layers_json)
    return layers_json
