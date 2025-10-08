from fastapi import FastAPI
from src.api.auth import router as auth_router
from src.api.dashboard import router as dashboard_router
from src.api.goals import router as goals_router
from src.api.notifications import router as notifications_router
from src.api.weight_entries import router as weight_entries_router

app = FastAPI(
    title="Weight Loss Tracker API",
    version="1.0.0",
    description="API for a weight loss tracker with goals, charts, and milestone notifications",
)

# Include routers
app.include_router(auth_router, prefix="/api/v1/auth", tags=["auth"])
app.include_router(
    weight_entries_router, prefix="/api/v1/weight-entries", tags=["weight_entries"]
)
app.include_router(goals_router, prefix="/api/v1/goals", tags=["goals"])
app.include_router(
    notifications_router, prefix="/api/v1/notifications", tags=["notifications"]
)
app.include_router(dashboard_router, prefix="/api/v1/dashboard", tags=["dashboard"])


@app.get("/")
async def root():
    return {"message": "Welcome to the Weight Loss Tracker API"}


@app.get("/health")
async def health_check():
    return {"status": "healthy"}
