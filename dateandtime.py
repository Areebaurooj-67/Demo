from fastapi import FastAPI
from datetime import datetime

app = FastAPI()

@app.get("/datetime")
def get_datetime():
    return {"current_datetime": datetime.utcnow().isoformat()}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
