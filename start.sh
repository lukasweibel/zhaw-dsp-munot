#!/bin/bash

source .venv/bin/activate

export FLASK_APP=api/service.py

cd frontend

npm run build

cd ..

flask run