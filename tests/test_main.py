from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_health_endpoint():
	response = client.get("/health")
	assert response.status_code == 200
	assert response.json() == {"status": "ok", "environment": "k3s-sovereign"}

def test_metrics_endpoint():
	response = client.get("/metrics")
	assert response.status_code == 200
	# Verify exporuse of prometheus metrics
	assert "http_request_total" in response.text or "process_cpu_seconds_total" in response.text
