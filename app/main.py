from fastapi import FastAPI
from prometheus_fastapi_instrumentator import Instrumentator

app = FastAPI(title = "Sovereign Platform Telemetry API")

# Get metrics
Instrumentator().instrument(app).expose(app)

@app.get("/health")
def health_check():
	return {"status": "ok", "enviroment": "k3s-sovereign"}
