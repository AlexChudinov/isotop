PIP = venv/bin/pip3
PYTHON3 = venv/bin/python3
BUILD_FILES = venv

venv:
	python3 -m venv venv
	$(PIP) install -r requirements.txt

load-table:
	$(PYTHON3) mysql/load_table.py

clean:
	rm -rf $(BUILD_FILES)
