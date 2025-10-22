python3.11 -m venv tmp/venv
chmod +x ./bin/activate.sh
(source bin/activate.sh && pip install -r src/requirements.txt && pip uninstall -y openai && pip install -y openai)