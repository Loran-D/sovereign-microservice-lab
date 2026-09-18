.PHONY: install test build run clean

install:
	pip install -r app/requirements.txt

test:
	PYTHONPATH=. pytest tests/

build:
	docker build -t sovereign-app:v0.1.0 -f docker/Dockerfile .

run:
	docker run -p 8000:8000 sovereign-app:v0.1.0

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
