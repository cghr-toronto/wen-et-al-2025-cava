py -3.11 -m venv tmp/venv
(call bin\activate && pip install -r src/requirements.txt && pip uninstall -y openai && pip install -y openai)